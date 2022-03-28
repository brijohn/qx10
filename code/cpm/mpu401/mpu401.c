/*****************************************************************
 * Tests MPU401 by playing a scale
 *
 * (c) Copyright 2021-2022  Brian Johnson <brijohn@gmail.com>
 *
 * zcc +cpm mpu401.c -o mpu401.com
 *
 *****************************************************************/

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdio.h>

#define DATAPORT 0xc2
#define STATPORT 0xc3
#define CMDPORT  0xc3

// True if not rdy, else false
bool rx_not_rdy()
{
	return !!(inp(STATPORT) & 0x80);
}

//returns true if not rdy, else false
bool tx_not_rdy()
{
	return !!(inp(STATPORT) & 0x40);
}

uint8_t mpu_in()
{
	return inp(DATAPORT);
}

void mpu_out(uint8_t data)
{
	outp(DATAPORT, data);
}

void set_uart()
{
	while(tx_not_rdy());

	outp(CMDPORT, 0xFF);

	do {
		while(rx_not_rdy());
	} while(mpu_in() != 0xFE);

	while(tx_not_rdy());

	outp(CMDPORT, 0x3F);
}

void voice_on(uint8_t channel, uint8_t note, uint8_t velocity)
{
	channel = (channel & 0x0f) | 0x90;
	note &= 0x7f;
	velocity &= 0x7f;

	while(tx_not_rdy());
	mpu_out(channel);

	while(tx_not_rdy());
	mpu_out(note);

	while(tx_not_rdy());
	mpu_out(velocity);
}

void voice_off(uint8_t channel, uint8_t note, uint8_t velocity)
{
	channel = (channel & 0x0f) | 0x80;
	note &= 0x7f;
	velocity &= 0x7f;

	while(tx_not_rdy());
	mpu_out(channel);

	while(tx_not_rdy());
	mpu_out(note);

	while(tx_not_rdy());
	mpu_out(velocity);

}

uint8_t scale[] = {60, 62, 64, 65, 67, 69, 71};

int main(int argc, char**argv)
{
	uint8_t channel;
	if (argc != 2) {
		printf("Usage: mpu401 <channel number>\n");
		return 0;
	}
	channel = atoi(argv[1]);
	printf("Setting MPU401 to UART mode...");
	set_uart();
	printf("Done\n");
	printf("Playing scale on channel %d\n", channel);
	for (int i =0; i < 7; ++i) {
		voice_on(channel, scale[i], 64);
		sleep(2);
		voice_off(channel, scale[i], 0);
	}
	return 0;
}
