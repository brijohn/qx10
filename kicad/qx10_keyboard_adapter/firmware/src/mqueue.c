#include "pico/util/queue.h"


queue_t scancodes; // Priority 3
queue_t switches;  // Priority 2
queue_t leds;      // Priority 1

queue_t incoming;  // Messages to keyboard

void mqueue_init()
{
	queue_init(&scancodes, sizeof(uint8_t), 32);
	queue_init(&switches, sizeof(uint8_t), 16);
	queue_init(&leds, sizeof(uint8_t), 16);
	queue_init(&incoming, sizeof(uint8_t), 8);
}

bool mqueue_put_scancode(uint8_t scancode)
{
	bool added;
	if ((scancode & 0x80) == 0) {
		added = queue_try_add(&scancodes, &scancode);
	} else {
		if (scancode & 0x40) {
			added = queue_try_add(&leds, &scancode);
		} else {
			added = queue_try_add(&switches, &scancode);
		}
	}
	return added;
}

bool mqueue_get_scancode(uint8_t *scancode)
{
	if (queue_try_remove(&leds, scancode)) return true;
	if (queue_try_remove(&switches, scancode)) return true;
	if (queue_try_remove(&scancodes, scancode)) return true;

	return false;
}

bool mqueue_put_message(uint8_t cmd)
{
	return queue_try_add(&incoming, &cmd);

}

bool mqueue_get_message(uint8_t *cmd)
{
	return queue_try_remove(&incoming, cmd);
}

