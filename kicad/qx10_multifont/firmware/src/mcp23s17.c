#include "mcp23s17.h"
#include <avr/io.h>


// SPI control port and pin definitions
#define SPI_PORT	PORTB
#define SPI_DDR		DDRB
#define SPI_CS_PIN	PB4
#define SPI_MOSI	PB5
#define SPI_SCK		PB7

// MCP23S17 SPI Constants
#define MCP_WRITE_OPCODE	0x40	// A2:A0 = 000 (default MCP23S17 address)
#define REG_IODIRA			0x00
#define REG_IODIRB			0x01
#define REG_GPIOA			0x12
#define REG_GPIOB			0x13

static void spi_transfer(uint8_t data) {
	SPDR = data;
	while (!(SPSR & (1 << SPIF)));
}

static void mcp23s17_write(uint8_t reg, uint8_t data) {
	SPI_PORT &= ~(1 << SPI_CS_PIN);		// Select chip

	spi_transfer(MCP_WRITE_OPCODE);
	spi_transfer(reg);
	spi_transfer(data);

	SPI_PORT |= (1 << SPI_CS_PIN);		// Deselect chip
}

void mcp23s17_init(void) {
	// Initialize SPI (MOSI, SCK, CS as output)
	SPI_DDR |= (1 << SPI_MOSI) | (1 << SPI_SCK) | (1 << SPI_CS_PIN);
	SPCR = (1 << SPE) | (1 << MSTR);	// Enable SPI, Master mode, fosc/4
	SPSR &= ~(1 << SPI2X);
	SPI_PORT |= (1 << SPI_CS_PIN);		// Deselect chip

	// Configure MCP23S17 as output
	mcp23s17_write(REG_IODIRA, 0x00);
	mcp23s17_write(REG_IODIRB, 0x00);
}

void mcp23s17_set_address(uint16_t address) {
	uint8_t low = address & 0xFF;
	uint8_t high = (address >> 8) & 0xFF;

	mcp23s17_write(REG_GPIOA, low);
	mcp23s17_write(REG_GPIOB, high);
}
