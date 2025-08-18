#include "bus.h"
#include <avr/io.h>
#include <util/delay.h>

// Pin definitions
#define BUS_PORT		PORTA
#define BUS_PIN			PINA
#define BUS_DDR			DDRA

// Error condition (P2.5 → PB0)
#define ERROR_PORT		PORTB
#define ERROR_DDR		DDRB
#define ERROR_PIN		PB0

// Control on PORTC: IRQ (PC6), ADDR16 (PC7)
#define CTRL_PORTC		PORTC
#define CTRL_DDRC		DDRC
#define IRQ_PIN			PC6	// P1.7 = interrupt (active low)
#define ADDR16_PIN		PC7	// P2.7 = bit 13 of shifted address

#define CTRL_PIN		PIND
#define CTRL_PORT		PORTD
#define CTRL_DDR		DDRD
#define WR_PIN			PD6
#define RD_PIN			PD7
#define BUS_READ_EN_PIN	PD4
#define FONT_READ_EN_PIN PD5
#define T0_PIN			PD2
#define T1_PIN			PD3



void bus_init(void) {
	// Set BUS to input by default
	BUS_DDR = 0x00;

	// Set default control line states: WR/RD inactive, no source selected
	CTRL_PORT |= (1 << WR_PIN) | (1 << RD_PIN);
	CTRL_PORT &= ~((1 << BUS_READ_EN_PIN) | (1 << FONT_READ_EN_PIN));

	// Set control lines as output
	CTRL_DDR |= (1 << WR_PIN) | (1 << RD_PIN) |
	            (1 << BUS_READ_EN_PIN) | (1 << FONT_READ_EN_PIN);


	// Set default control line states: IRQ inactive, addr16 = 0
	CTRL_PORTC |= (1 << IRQ_PIN);
	CTRL_DDRC |= (1 << IRQ_PIN) | (1 << ADDR16_PIN);

	ERROR_PORT &= ~(1 << ERROR_PIN);
	ERROR_DDR |= (1 << ERROR_PIN);
}

void bus_clear_error(void) { ERROR_PORT &= ~(1 << ERROR_PIN); }
void bus_set_error(void) { ERROR_PORT |= (1 << ERROR_PIN); }
void bus_wait_for_t0_high(void) { while (!(CTRL_PIN & (1 << T0_PIN))); }
void bus_wait_for_t1_low(void) { while (CTRL_PIN & (1 << T1_PIN)); }

void bus_set_addr16(uint8_t value)
{
	CTRL_PORTC &= ~(1 << ADDR16_PIN);
	if (value) {
		CTRL_PORTC |= 1 << ADDR16_PIN;
	}
}

void bus_strobe_int()
{
	CTRL_PORTC &= ~(1 << IRQ_PIN);
	CTRL_PORTC |= (1 << IRQ_PIN);
}

void bus_write(uint8_t value) {
	// Set PORTA to output
	BUS_PORT = value;
	BUS_DDR = 0xFF;

	// Strobe /WR low
	CTRL_PORT &= ~(1 << WR_PIN);
	_delay_us(1);
	CTRL_PORT |= (1 << WR_PIN);

	// Return BUS to input mode
	BUS_DDR = 0x00;
}

uint8_t bus_read(uint8_t source) {
	uint8_t value;

	// Ensure PORTA is input
	BUS_DDR = 0x00;

	// Select read source
	if (source == BUS_SOURCE_MAIN) {
		CTRL_PORT |= (1 << BUS_READ_EN_PIN);
	} else if (source == BUS_SOURCE_FONT) {
		CTRL_PORT |= (1 << FONT_READ_EN_PIN);
	}

	// Strobe /RD low
	CTRL_PORT &= ~(1 << RD_PIN);
	_delay_us(2);
	value = BUS_PIN;
	CTRL_PORT |= (1 << RD_PIN);

	// Deselect sources
	CTRL_PORT &= ~((1 << BUS_READ_EN_PIN) | (1 << FONT_READ_EN_PIN));

	return value;
}
