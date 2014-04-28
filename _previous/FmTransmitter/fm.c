#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
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
	int device = open("/dev/fm-transmitter", 2);
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
	int device = open("/dev/fm-transmitter", 2);
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
	int device = open("/dev/fm-transmitter", 2);
	if (device < 0) { return -1; }
	int frequency = 0;
	int result = ioctl(device, GET_FREQUENCY, &frequency);
	close(device);
	return (result) ? -1 : frequency;
}

int set_transmitter_frequency(int frequency)
{
	int device = open("/dev/fm-transmitter", 2);
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
	if (set_transmitter_state(DISABLED)) {
		puts("Error: DISABLE");
		return 1;
	}
	enum transmitter_state state = INVALID;
	state = get_transmitter_state();
	print_state(state);
	printf("Frequency: %i\n", get_transmitter_frequency());
	printf("Set frequency to 999: %i\n", set_transmitter_frequency(999));
	printf("Frequency: %i\n", get_transmitter_frequency());
	puts("");
	if (set_transmitter_state(ENABLED)) {
		puts("Error: ENABLE");
		return 1;
	}
	state = get_transmitter_state();
	print_state(state);
	printf("Frequency: %i\n", get_transmitter_frequency());
	printf("Set frequency to 999: %i\n", set_transmitter_frequency(999));
	printf("Frequency: %i\n", get_transmitter_frequency());
	puts("");
	if (set_transmitter_state(DISABLED)) {
		puts("Error: DISABLE");
		return 1;
	}
	state = get_transmitter_state();
	print_state(state);
	printf("Frequency: %i\n", get_transmitter_frequency());
	printf("Set frequency to 999: %i\n", set_transmitter_frequency(999));
	printf("Frequency: %i\n", get_transmitter_frequency());
	puts("");
    return 0;
}
