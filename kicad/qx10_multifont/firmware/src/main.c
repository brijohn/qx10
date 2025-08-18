#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>

#include "avr/io.h"

#include "bus.h"
#include "mcp23s17.h"
#include "uart.h"

#include "rom_lookup_table.h"

//#define DEBUG

uint8_t font_data[42];

inline uint32_t get_rom_address(uint16_t code_point) {
	return ((uint32_t)code_point) << 5;
}

void set_font_rom_address(uint32_t rom_address) {
	mcp23s17_set_address(rom_address & 0xFFFF);

	// Set ADDR16 = bit 16 of original ROM address
	bus_set_addr16((rom_address >> 16) & 1);
}

uint8_t prepare_output_crt(uint8_t command) {
	uint8_t R2 = 0, R3 = 0, R4 = 0, R5 = 0, R6 = 0;
	for (uint8_t i = 0; i < 16; i += 2) {
		uint8_t b0 = font_data[i];
		R2 <<= 1; R2 |= (b0 >> 7);
		font_data[i] = b0 & 0x7F;
		uint8_t b1 = font_data[i + 1];
		R4 <<= 1; R4 |= (b1 & 0x01);
		font_data[i + 1] = b1 & 0xFE;
	}
	for (uint8_t i = 16; i < 32; i += 2) {
		uint8_t b0 = font_data[i];
		R3 <<= 1; R3 |= (b0 >> 7);
		font_data[i] = b0 & 0x7F;
		uint8_t b1 = font_data[i + 1];
		R5 <<= 1; R5 |= (b1 & 0x01);
		font_data[i + 1] = b1 & 0xFE;
	}
	R6 = 0;
	R6 = (R6 << 1) | ((R2 >> 7) & 1); font_data[32] = R2 & 0x7F;
	R6 = (R6 << 1) | ((R4 >> 7) & 1); font_data[33] = R3 & 0x7F;
	R6 = (R6 << 1) | (R3 & 1);        font_data[34] = R4 & 0xFE;
	R6 = (R6 << 1) | (R5 & 1);        font_data[35] = R5 & 0xFE;

	if (command & 0x01) {
		for (uint8_t i = 0; i < 36; i++) {
			font_data[i] = rom_lookup_table[font_data[i]];
		}
	}
	return R6 | 0x40;
}

void output_font_data_to_bus(uint8_t status_byte, uint8_t count)
{
	bus_wait_for_t1_low();
	bus_write(status_byte);
	bus_strobe_int();
	for (uint8_t i = 0; i < count; i++) {
		bus_wait_for_t1_low();
		bus_write(font_data[i]);
	}
}

__attribute__((OS_main)) int main(void)
{
	uint8_t command, code_lo, code_hi;
	uint16_t code_point;
	uint32_t rom_address;

	uart_init(4800);

	printf("QX-10 Multifont card\r\n");

	bus_init();
	mcp23s17_init();

	mcp23s17_set_address(0x0000);

	while(true) {
		do {
#ifdef DEBUG
			printf("Waiting for input\r\n");
#endif
			bus_wait_for_t0_high();
			bus_clear_error();
			command = bus_read(BUS_SOURCE_MAIN);
			if ((command & 0x80) == 0) bus_set_error();
		} while ((command & 0x80) == 0);
#ifdef DEBUG
		printf("Command: %X\r\n", command);
#endif

		bus_clear_error();
		bus_wait_for_t0_high();
		code_lo = bus_read(BUS_SOURCE_MAIN);
#ifdef DEBUG
		printf("Code LO: %X\r\n", code_lo);
#endif
		bus_wait_for_t0_high();
		code_hi = bus_read(BUS_SOURCE_MAIN);
#ifdef DEBUG
		printf("Code HI: %X\r\n", code_hi);
#endif
		// Check if code point is between 0x0000 and 0x0EFF
		if ((code_hi & 0xF0) != 0x00 || ((code_hi + 0xF1) == 0x00)) {
			bus_set_error(); continue;
		}

		code_point = ((uint16_t)code_hi << 8) | code_lo;
#ifdef DEBUG
		printf("Code Point: %X\r\n", code_point);
#endif
		rom_address = get_rom_address(code_point);
#ifdef DEBUG
		printf("ROM Address: %lX\r\n", rom_address);
#endif
		for (uint8_t i = 0; i < 32; i++) {
			set_font_rom_address(rom_address + i);
			font_data[i] = bus_read(BUS_SOURCE_FONT);
		}
#ifdef DEBUG
		for (uint8_t i = 0; i < 32; i++) {
			printf("%02X ", font_data[i]);
			if ((i + 1) % 16 == 0) printf("\r\n");
		}
		printf("\r\n");
#endif
		if (command & 0x40) {
			uint8_t status = prepare_output_crt(command);
#ifdef DEBUG
			printf("Status: %X\r\n", status);
			for (uint8_t i = 0; i < 36; i++) {
				printf("%02X ", font_data[i]);
				if ((i + 1) % 16 == 0) printf("\r\n");
			}
			printf("\r\n");
#endif
			output_font_data_to_bus(status, 36);
		} else {
			printf("Printer Font not implemented\r\n");
		}
	}
	__builtin_unreachable();
}
