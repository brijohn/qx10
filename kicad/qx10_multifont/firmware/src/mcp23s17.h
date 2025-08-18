#ifndef MCP23S17_H
#define MCP23S17_H

#include <avr/io.h>

void mcp23s17_init(void);
void mcp23s17_set_address(uint16_t address);

#endif // MCP23S17_H
