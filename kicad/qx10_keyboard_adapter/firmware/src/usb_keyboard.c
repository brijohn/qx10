#include "stdint.h"
#include "tusb.h"
#include "mqueue.h"

#define MAX_REPORT  4

#define LCTRL_MASK   0x01
#define LSHIFT_MASK  0x02
#define LALT_MASK    0x04
#define LMETA_MASK   0x08
#define RCTRL_MASK   0x10
#define RSHIFT_MASK  0x20
#define RALT_MASK    0x40
#define RMETA_MASK   0x80

uint8_t left_meta = 0;

#define SW_RSHIFT  2
#define SW_LSHIFT  3
#define SW_CTRL    5
#define SW_GRAPH   6
uint8_t switch_state = 0;

#define LED_CAPS   0
#define LED_INS    2
#define LED_MF4    4
#define LED_MF3    5
#define LED_MF2    6
#define LED_MF1    7
uint8_t led_state = 0;

uint16_t repeat_start = 500;
uint16_t repeat_interval = 50;
bool repeat_enable = true;

uint8_t repeat_scancode = 0;
absolute_time_t repeat_start_time = 0;
absolute_time_t repeat_send_time = 0;


bool keyboard_send = true;



typedef void (*message_handler)(char);

// Each HID instance can has multiple reports
static struct
{
	uint8_t report_count;
	tuh_hid_report_info_t report_info[MAX_REPORT];
} hid_info[CFG_TUH_HID];


static inline bool find_key_in_report(hid_keyboard_report_t const *report, uint8_t keycode);
static void process_kbd_report(hid_keyboard_report_t const *report);
static void kbd_modifiers_changed(uint8_t before, uint8_t after);
static void kbd_send_repeat(uint8_t key);
static void kbd_keyup(uint8_t modifier, uint8_t key);
static void kbd_keydown(uint8_t modifier, uint8_t key);

static void keyboard_repeat_start_time(char msg);
static void keyboard_repeat_interval(char msg);
static void keyboard_led_set(char msg);
static void keyboard_led_status(char msg);
static void keyboard_sw_status(char msg);
static void keyboard_control_repeat(char msg);
static void keyboard_enable_send(char msg);
static void keyboard_reset(char msg);

void tuh_hid_mount_cb(uint8_t dev_addr, uint8_t instance, uint8_t const* desc_report, uint16_t desc_len)
{
	printf("HID device address = %d, instance = %d is mounted\r\n", dev_addr, instance);

	// Interface protocol (hid_interface_protocol_enum_t)
	const char* protocol_str[] = { "None", "Keyboard", "Mouse" };
	uint8_t const itf_protocol = tuh_hid_interface_protocol(dev_addr, instance);

	printf("HID Interface Protocol = %s\r\n", protocol_str[itf_protocol]);

	// By default host stack will use activate boot protocol on supported interface.
	// Therefore for this simple example, we only need to parse generic report descriptor (with built-in parser)
	if ( itf_protocol == HID_ITF_PROTOCOL_NONE ) {
		hid_info[instance].report_count = tuh_hid_parse_report_descriptor(hid_info[instance].report_info, MAX_REPORT, desc_report, desc_len);
		printf("HID has %u reports \r\n", hid_info[instance].report_count);
	}

	// request to receive report
	// tuh_hid_report_received_cb() will be invoked when report is available
	if ( !tuh_hid_receive_report(dev_addr, instance) ) {
		printf("Error: cannot request to receive report\r\n");
	}

}

void tuh_hid_umount_cb(uint8_t dev_addr, uint8_t instance)
{
	printf("HID device address = %d, instance = %d is unmounted\r\n", dev_addr, instance);
}

void tuh_hid_report_received_cb(uint8_t dev_addr, uint8_t instance, uint8_t const* report, uint16_t len)
{
	uint8_t const itf_protocol = tuh_hid_interface_protocol(dev_addr, instance);

	switch (itf_protocol) {
	case HID_ITF_PROTOCOL_KEYBOARD:
		process_kbd_report( (hid_keyboard_report_t const*) report );
		break;
	default:
		break;
	}

	if ( !tuh_hid_receive_report(dev_addr, instance) ) {
		printf("Error: cannot request to receive report\r\n");
	}
}


static inline bool find_key_in_report(hid_keyboard_report_t const *report, uint8_t keycode)
{
	for(uint8_t i = 0; i < 6; ++i) {
		if (report->keycode[i] == keycode) return true;
	}
	return false;
}

static void process_kbd_report(hid_keyboard_report_t const *report)
{
	static hid_keyboard_report_t prev_report = { 0, 0, {0} };
	if (prev_report.modifier != report->modifier) {
		kbd_modifiers_changed(prev_report.modifier, report->modifier);
	}
	for(uint8_t i = 0; i < 6; ++i) {
		if (!find_key_in_report(&prev_report, report->keycode[i])) {
			kbd_keydown(report->modifier, report->keycode[i]);
		}
		if (!find_key_in_report(report, prev_report.keycode[i])) {
			kbd_keyup(report->modifier, prev_report.keycode[i]);
		}
	}
	prev_report = *report;
}
//ASCII
uint8_t keymapping[] = {0x00, 0x00, 0x00, 0x00, 0x43, 0x37, 0x35, 0x45, 0x53, 0x46, 0x47, 0x48, 0x58, 0x49, 0x4a, 0x4b,  //0x
                        0x39, 0x38, 0x59, 0x5a, 0x51, 0x54, 0x44, 0x55, 0x57, 0x36, 0x52, 0x34, 0x56, 0x33, 0x76, 0x61,  //1x
                        0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x4e, 0x75, 0x6d, 0x77, 0x32, 0x6a, 0x6b, 0x5c,  //2x
                        0x5d, 0x6c, 0x00, 0x4c, 0x4d, 0x00, 0x3a, 0x3b, 0x4f, 0x31, 0x73, 0x72, 0x71, 0x01, 0x02, 0x03,  //3x
                        0x04, 0x05, 0x06, 0x07, 0x00, 0x00, 0x0b, 0x00, 0x0a, 0x5e, 0x6e, 0x00, 0x5f, 0x6f, 0x00, 0x3e,  //4x
                        0x3d, 0x3f, 0x3c, 0x00, 0x2e, 0x2d, 0x28, 0x18, 0x15, 0x27, 0x26, 0x25, 0x1b, 0x1a, 0x19, 0x2b,  //5x
                        0x2a, 0x29, 0x17, 0x16, 0x00, 0x00, 0x00, 0x2c, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}; //6x

uint8_t swmapping[] =  { 0x80, 0x82, 0x84, 0x86, 0x88, 0x8a, 0x8c, 0x8e};

message_handler handlers[8] = {
	keyboard_repeat_start_time,
	keyboard_repeat_interval,
	keyboard_led_set,
	keyboard_led_status,
	keyboard_sw_status,
	keyboard_control_repeat,
	keyboard_enable_send,
	keyboard_reset,
};

static void kbd_modifiers_changed(uint8_t before, uint8_t after)
{
	uint8_t scancode;

	if ((before & LCTRL_MASK) != (after & LCTRL_MASK)) {
		scancode = 0x80 | (SW_CTRL << 1);
		if (after & LCTRL_MASK) {
			mqueue_put_scancode(swmapping[SW_CTRL] | 0x01);
			switch_state |= 1 << (SW_CTRL);
		} else {
			mqueue_put_scancode(swmapping[SW_CTRL]);
			switch_state &= ~(1 << SW_CTRL);
		}
	}
	if ((before & RSHIFT_MASK) != (after & RSHIFT_MASK)) {
		scancode = 0x80 | (SW_RSHIFT << 1);
		if (after & RSHIFT_MASK) {
			mqueue_put_scancode(swmapping[SW_RSHIFT] | 0x01);
			switch_state |= (1 << SW_RSHIFT);
		} else {
			mqueue_put_scancode(swmapping[SW_RSHIFT]);
			switch_state &= ~(1 << SW_RSHIFT);
		}
	}
	if ((before & LSHIFT_MASK) != (after & LSHIFT_MASK)) {
		scancode = 0x80 | (SW_LSHIFT << 1);
		if (after & LSHIFT_MASK) {
			mqueue_put_scancode(swmapping[SW_LSHIFT] | 0x01);
			switch_state |= (1 << SW_LSHIFT);
		} else {
			mqueue_put_scancode(swmapping[SW_LSHIFT]);
			switch_state &= ~(1 << SW_LSHIFT);
		}
	}
	if ((before & RMETA_MASK) != (after & RMETA_MASK)) {
		scancode = 0x80 | (SW_GRAPH << 1);
		if (after & RMETA_MASK) {
			mqueue_put_scancode(swmapping[SW_GRAPH] | 0x01);
			switch_state |= (1 << SW_GRAPH);
		} else {
			mqueue_put_scancode(swmapping[SW_GRAPH]);
			switch_state &= ~(1 << SW_GRAPH);
		}
	}
	if ((before & LMETA_MASK) != (after & LMETA_MASK)) {
		if (after & RMETA_MASK) {
			left_meta = 1;
		} else {
			left_meta = 0;
		}
	}
}


static void kbd_keyup(uint8_t modifier, uint8_t key)
{
	if (key < sizeof(keymapping)) {
		if (keymapping[key] == repeat_scancode) {
			repeat_scancode = 0;
			repeat_start_time = 0;
			repeat_send_time = 0;
		}
	}
}

static void kbd_keydown(uint8_t modifier, uint8_t key)
{
	if (key < sizeof(keymapping)) {
		mqueue_put_scancode(keymapping[key]);
		absolute_time_t now = to_us_since_boot(get_absolute_time());
		repeat_scancode = keymapping[key];
		repeat_start_time = make_timeout_time_ms(repeat_start);
		repeat_send_time = 0;
	}
}

static void keyboard_repeat_start_time(char msg)
{
	repeat_start = ((msg & 0x1f) * 25) + 300;
	printf("Keyboard Repeat Start Time: %d\r\n", repeat_start);
}

static void keyboard_repeat_interval(char msg)
{
	repeat_interval = ((msg & 0x1f) * 5) + 30;
	printf("Keyboard Repeat Interval: %d\r\n", repeat_interval);
}

static void keyboard_led_set(char msg)
{
	uint8_t state = msg & 1;
	uint8_t led = (msg >> 1) & 7;

	led_state = (led_state & ~(1 << led)) | (state << led);
	printf("Set LED %d to %d\r\n", led, state);
}

static void keyboard_led_status(char msg)
{
	uint8_t scancode;
	for (int i = 0; i < 8; ++i) {
		scancode = 0xc0 | (i << 1) | ((led_state & (1 <<  i)) >> i);
		mqueue_put_scancode(scancode);
	}
}

static void keyboard_sw_status(char msg)
{
	uint8_t scancode;
	for (int i = 0; i < 8; ++i) {
		scancode = 0x80 | (i << 1) | ((switch_state & (1 <<  i)) >> i);
		mqueue_put_scancode(scancode);
	}
}

static void keyboard_control_repeat(char msg)
{
	repeat_enable = msg & 1;

	printf("Repeat %s\r\n", repeat_enable ? "ENABLED" : "DISABLED");
}

static void keyboard_enable_send(char msg)
{
	keyboard_send = msg & 1;

	printf("Send %s\r\n", keyboard_send ? "ENABLED" : "DISABLED");
}

static void keyboard_reset(char msg)
{
	uint8_t diag = msg & 1;

	repeat_start = 500;
	repeat_interval = 50;
	repeat_enable = true;

	led_state = 0;
	keyboard_send = true;

	if (diag == 0) {
		mqueue_put_scancode(0x00);
	}

	printf("Keyboard Reset. Diag Bit: %d\r\n", diag);
}

static void keyboard_send_repeat(uint8_t scancode)
{
	absolute_time_t now;

	now = to_us_since_boot(get_absolute_time());
	if (repeat_enable && scancode != 0 && now >= repeat_start_time) {
		if (now >= repeat_send_time) {
			repeat_send_time = make_timeout_time_ms(repeat_interval);
			mqueue_put_scancode(scancode);
		}
	}
}

void keyboard_main(void)
{
	uint8_t message;

	tuh_init(BOARD_TUH_RHPORT);
	while (true)
	{
		tuh_task();
		keyboard_send_repeat(repeat_scancode);
		if(mqueue_get_message(&message)) {
			handlers[(message & 0xE0) >> 5](message);
		}
	}
}
