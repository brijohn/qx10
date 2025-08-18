#include <stdio.h>
#include <avr/io.h>
#include <avr/interrupt.h>

#include "uart.h"

int print_char(char character, FILE *stream);
FILE uart_stream = FDEV_SETUP_STREAM(print_char, NULL, _FDEV_SETUP_WRITE);

void uart_init (uint32_t bps)
{
	uint8_t n;

	n = (((F_CPU / (16UL * bps))) - 1);
	UCSRB |= _BV(RXEN)|_BV(TXEN);
	UCSRC |= (1 << URSEL) | (1 << UCSZ0) | (1 << UCSZ1);
	UBRRL = n;

	stdout = &uart_stream;
}


int print_char(char character, FILE *stream)
{
	while ((UCSRA & (1 << UDRE)) == 0) {};
	UDR = character;
	return 0;
}
