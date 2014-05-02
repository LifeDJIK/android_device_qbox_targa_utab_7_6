#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

enum transmitter_command {
	ENABLE = 0x8201u,
	DISABLE = 0x8202u,
	SET_FREQUENCY = 0x8203u,
	GET_FREQUENCY = 0x8204u,
	GET_STATE = 0x8205u
};

enum transmitter_state { ENABLED, DISABLED, INVALID };

int set_transmitter_state(enum transmitter_state state)
{
	int device = open("/dev/fm-transmitter", O_RDWR);
	if (device < 0) { return -1; }
	enum transmitter_command command;
	switch (state) {
		case ENABLED:
			command = ENABLE;
			break;
		case DISABLED:
		default:
			command = DISABLE;
	}
	int result = ioctl(device, command, 0);
	close(device);
	return (result) ? -1 : 0;
}

enum transmitter_state get_transmitter_state()
{
	int device = open("/dev/fm-transmitter", O_RDWR);
	if (device < 0) { return INVALID; }
	int state = 0;
	int result = ioctl(device, GET_STATE, &state);
	close(device);
	if (result) { return DISABLED; } // Transmitter was not enabled even once after boot
	switch (state) {
		case 1:
			return ENABLED;
		case 0:
			return DISABLED;
		default:
			break;
	}
	return INVALID;
}

int get_transmitter_frequency()
{
	int device = open("/dev/fm-transmitter", O_RDWR);
	if (device < 0) { return -1; }
	int frequency = 0;
	int result = ioctl(device, GET_FREQUENCY, &frequency);
	close(device);
	return (result) ? -1 : frequency;
}

int set_transmitter_frequency(int frequency)
{
	int device = open("/dev/fm-transmitter", O_RDWR);
	if (device < 0) { return -1; }
	int result = ioctl(device, SET_FREQUENCY, &frequency);
	close(device);
	return (result) ? -1 : 0;
}

void print_state(enum transmitter_state state)
{
	switch (state) {
		case ENABLED:
			puts("State: ENABLED");
			break;
		case DISABLED:
			puts("State: DISABLED");
			break;
		case INVALID:
		default:
			puts("State: INVALID");
	}
}

int main(int argc, char **argv)
{
	if (argc < 2) {
		printf("Bad parameters. Use '%s --help' for help.", argv[0]);
		return 1;
	}
	if (!strcmp(argv[1], "--help")) {
		printf("Usage: %s <action> [argument]", argv[0]);
		puts("\t--help - this help");
		puts("\t--disable - disable transmitter");
		puts("\t--enable - enable transmitter");
		puts("\t--frequency - get frequency");
		puts("\t--frequency <frequency> - set frequency");
		return 0;
	}
	if (!strcmp(argv[1], "--disable")) {
		printf("Disabling FM transmitter.");
		if (set_transmitter_state(DISABLED)) {
			puts("Error: DISABLE");
			return 1;
		}
		return 0;
	}
	if (!strcmp(argv[1], "--enable")) {
		printf("Enabling FM transmitter.");
		if (set_transmitter_state(ENABLE)) {
			puts("Error: ENABLE");
			return 1;
		}
		return 0;
	}
	if (!strcmp(argv[1], "--enable")) {
		printf("Enabling FM transmitter.");
		if (set_transmitter_state(ENABLE)) {
			puts("Error: ENABLE");
			return 1;
		}
		return 0;
	}
	if (!strcmp(argv[1], "--frequency")) {
		if (argc == 3) {
			int frequency = atoi(argv[2]);
			set_transmitter_frequency(frequency);
			printf("Set frequency to: %i\n", get_transmitter_frequency());
		} else {
			printf("Frequency: %i\n", get_transmitter_frequency());
		}
		return 0;
	}	
	printf("Bad parameters. Use '%s --help' for help.", argv[0]);
	return 1;
	//~ enum transmitter_state state = INVALID;
	//~ state = get_transmitter_state();
	//~ print_state(state);
	//~ printf("Frequency: %i\n", get_transmitter_frequency());
	//~ printf("Set frequency to 999: %i\n", set_transmitter_frequency(999));
	//~ printf("Frequency: %i\n", get_transmitter_frequency());
	//~ puts("");
	//~ if (set_transmitter_state(ENABLED)) {
		//~ puts("Error: ENABLE");
		//~ return 1;
	//~ }
	//~ state = get_transmitter_state();
	//~ print_state(state);
	//~ printf("Frequency: %i\n", get_transmitter_frequency());
	//~ printf("Set frequency to 999: %i\n", set_transmitter_frequency(999));
	//~ printf("Frequency: %i\n", get_transmitter_frequency());
	//~ puts("");
	//~ if (set_transmitter_state(DISABLED)) {
		//~ puts("Error: DISABLE");
		//~ return 1;
	//~ }
	//~ state = get_transmitter_state();
	//~ print_state(state);
	//~ printf("Frequency: %i\n", get_transmitter_frequency());
	//~ printf("Set frequency to 999: %i\n", set_transmitter_frequency(999));
	//~ printf("Frequency: %i\n", get_transmitter_frequency());
	//~ puts("");
}
