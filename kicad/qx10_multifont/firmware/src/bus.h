#ifndef BUS_H
#define BUS_H

#include <avr/io.h>

#define BUS_SOURCE_MAIN	0
#define BUS_SOURCE_FONT	1

void bus_init(void);

void bus_clear_error(void);
void bus_set_error(void);
void bus_wait_for_t0_high(void);
void bus_wait_for_t1_low(void);

void bus_set_addr16(uint8_t);
void bus_strobe_int();

void bus_write(uint8_t value);
uint8_t bus_read(uint8_t source);

#endif // BUS_H
