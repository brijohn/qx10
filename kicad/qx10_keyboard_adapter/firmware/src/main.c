#include <stdio.h>
#include "serial.pio.h"
#include "pico/stdlib.h"
#include "pico/multicore.h"
#include "tusb.h"
#include "host/usbh.h"
#include "mqueue.h"

#define  PIO_FREQ 1000000

#define  PIN_RX  12
#define  PIN_TX  11

void keyboard_main(void);

static void pio_serial_rx(void)
{
	char rx_byte;
	while(!pio_sm_is_rx_fifo_empty(pio0, SM_RX)) {
		if (uart_rx_program_getc(pio0, SM_RX, &rx_byte)) {
			mqueue_put_message(rx_byte);
		}
	}
}

int main(void)
{
	int tx_offset, rx_offset;
	uint8_t scancode;

	stdio_init_all();
	mqueue_init();

	printf("Epson QX-10 Keyboard Adapter\n");
	tx_offset = pio_add_program(pio0, &uart_tx_program);
	rx_offset = pio_add_program(pio0, &uart_rx_program);
	pio_uart_init(pio0, rx_offset, tx_offset, PIN_RX, PIN_TX, PIO_FREQ);

	multicore_launch_core1(keyboard_main);

	irq_set_exclusive_handler(PIO0_IRQ_0, pio_serial_rx);
	irq_set_enabled(PIO0_IRQ_0, true);
	pio_set_irq0_source_enabled(pio0, pis_sm0_rx_fifo_not_empty + SM_RX, true);

	while(true) {
		if(mqueue_get_scancode(&scancode)) {
			uart_tx_program_putc(pio0, SM_TX, scancode);
		}
	}
}
