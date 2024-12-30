#include <stdio.h>
#include <stdlib.h>

#define BATTERY_PATH "/sys/class/power_supply/BAT0"

int main() {
    FILE *file;
    char path[256];
    int capacity;
    char status[16];

    // Read the battery capacity
    snprintf(path, sizeof(path), "%s/capacity", BATTERY_PATH);
    file = fopen(path, "r");
    if (file == NULL) {
        perror("Failed to open capacity file");
        return 1;
    }
    fscanf(file, "%d", &capacity);
    fclose(file);

    // Read the charging status
    snprintf(path, sizeof(path), "%s/status", BATTERY_PATH);
    file = fopen(path, "r");
    if (file == NULL) {
        perror("Failed to open status file");
        return 1;
    }
    fscanf(file, "%s", status);
    fclose(file);

    // Output battery information
    printf("Battery Capacity: %d%%\n", capacity);
    printf("Battery Status: %s\n", status);

    return 0;
}
