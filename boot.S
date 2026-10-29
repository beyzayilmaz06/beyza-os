/* Multiboot başlığı: QEMU/GRUB bunu görüp "bu bir çekirdek" der */
.set MAGIC,    0x1BADB002
.set FLAGS,    0x3
.set CHECKSUM, -(MAGIC + FLAGS)

.section .multiboot, "a"
.align 4
.long MAGIC
.long FLAGS
.long CHECKSUM

/* 16 KB yığın (stack) alanı */
.section .bss
.align 16
stack_bottom:
.skip 16384
stack_top:

/* Giriş noktası: stack'i kur, C koduna atla */
.section .text
.global _start
.type _start, @function
_start:
    mov $stack_top, %esp
    call kernel_main
    cli
1:  hlt
    jmp 1b