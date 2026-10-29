CC      = clang
LD      = ld.lld
CFLAGS  = --target=i686-elf -ffreestanding -fno-stack-protector -fno-pic \
          -mno-sse -mno-mmx -O2 -Wall -Wextra -std=c11
LDFLAGS = -m elf_i386 -T linker.ld -nostdlib

kernel.elf: boot.o kernel.o linker.ld
	$(LD) $(LDFLAGS) -o $@ boot.o kernel.o

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

%.o: %.S
	$(CC) $(CFLAGS) -c $< -o $@

run: kernel.elf
	qemu-system-i386 -kernel kernel.elf

clean:
	rm -f *.o kernel.elf

.PHONY: run clean