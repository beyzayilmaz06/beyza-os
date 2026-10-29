#include <stdint.h>
#include <stddef.h>

/* VGA text mode: ekran belleği 0xB8000 adresinde, 80x25 karakter */
#define VGA_WIDTH  80
#define VGA_HEIGHT 25
static volatile uint16_t *const VGA = (uint16_t *)0xB8000;

static size_t row = 0, col = 0;
static uint8_t color = 0x0F; /* siyah zemin, beyaz yazı */

static void putc(char c) {
    if (c == '\n') { col = 0; row++; return; }
    VGA[row * VGA_WIDTH + col] = (uint16_t)c | ((uint16_t)color << 8);
    if (++col == VGA_WIDTH) { col = 0; row++; }
    if (row == VGA_HEIGHT) row = 0;
}

static void print(const char *s) {
    while (*s) putc(*s++);
}

static void clear(void) {
    for (size_t i = 0; i < VGA_WIDTH * VGA_HEIGHT; i++)
        VGA[i] = (uint16_t)' ' | ((uint16_t)color << 8);
    row = col = 0;
}

void kernel_main(void) {
    clear();
    color = 0x0A; /* yeşil */
    print("Merhaba! Kendi isletim sistemim calisiyor.\n");
    color = 0x0F;
    print("Beyza OS v0.1\n");
}