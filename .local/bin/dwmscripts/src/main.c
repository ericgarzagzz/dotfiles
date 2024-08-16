#include "src/cpu.h"
#include <stdio.h>
#include <string.h>

void show_usage(const char *program_name) {
    printf("Usage: %s <script_name>\n", program_name);
    printf("Available scripts:\n");
    printf("  cpu           - Runs the CPU monitoring script.\n");
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        show_usage(argv[0]);
        return 1;
    }

    if (strcmp(argv[1], "cpu") == 0) {
        cpu_print_usage();
    } else {
        printf("Invalid script name.\n");
        show_usage(argv[0]);
        return 1;
    }

    return 0;
}
