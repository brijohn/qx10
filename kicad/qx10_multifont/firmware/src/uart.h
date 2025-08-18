#ifndef _UART_H
#define _UART_H

#include <stdint.h>

void uart_init (uint32_t bps);
uint8_t uart_getc (void);
void uart_putc (uint8_t d);

#endif
