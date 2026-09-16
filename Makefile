ASM = nasm
QEMU = qemu-system-i386

BOOT_SRC = boot.asm
BOOT_BIN = boot.bin
KERNEL_SRC = kernel.asm
KERNEL_BIN = kernel.bin
IMG = boot.img

QEMU_FLAGS = -cpu pentium2 -m 1g -fda $(IMG) -display curses

all: run

$(KERNEL_BIN): $(KERNEL_SRC)
	$(ASM) -f bin $(KERNEL_SRC) -o $(KERNEL_BIN)

$(BOOT_BIN): $(BOOT_SRC) $(KERNEL_BIN)
	$(ASM) -f bin $(BOOT_SRC) -dN=$(shell wc -c < $(KERNEL_BIN)) -o $(BOOT_BIN)

$(IMG): $(BOOT_BIN) $(KERNEL_BIN)
	dd if=/dev/zero of=$(IMG) bs=1024 count=1440
	dd if=$(BOOT_BIN) of=$(IMG) conv=notrunc
	dd if=$(KERNEL_BIN) of=$(IMG) conv=notrunc seek=1

run: $(IMG)
	$(QEMU) $(QEMU_FLAGS)

clean:
	rm -f $(BOOT_BIN) $(KERNEL_BIN) $(IMG)

.PHONY: all run clean
