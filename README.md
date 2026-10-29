# Beyza OS

İşletim sistemi kavramlarını uygulayarak öğrenmek için sıfırdan yazdığım x86 hobi işletim sistemi.

## Çalıştırma
```bash
make run
```
Gerekenler: clang, lld, qemu-system-x86, make

## Yol Haritası
- [x] Multiboot ile boot + VGA text mode
- [ ] printf + ekran kaydırma
- [ ] GDT / IDT, kesmeler
- [ ] Klavye ve timer
- [ ] Bellek yönetimi (fiziksel + paging)
- [ ] Heap (kmalloc)
- [ ] Process'ler ve scheduler
- [ ] User mode + sistem çağrıları
- [ ] Dosya sistemi
- [ ] Shell