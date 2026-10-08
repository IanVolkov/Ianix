QEMU = qemu-system-i386

BUILD_FOLDER = build

BOOT_SRC = boot.asm
BOOT_OBJ = $(BUILD_FOLDER)/boot.o

KERNEL_SRC = kernel.c
KERNEL_OBJ = $(BUILD_FOLDER)/kernel.o

LD_SCRIPT = link.ld
LINKED_FILE = $(BUILD_FOLDER)/os.elf

CLEANED_FILE = $(BUILD_FOLDER)/os.bin

IMG = $(BUILD_FOLDER)/boot.img

QEMU_FLAGS = -cpu pentium2 -m 1g -monitor stdio -device VGA -display curses
GCC_FLAGS = -std=c99 -m32 -O2 -ffreestanding -no-pie -fno-pie -mno-sse -fno-stack-protector

all: run

$(KERNEL_OBJ): $(KERNEL_SRC)
	gcc $(GCC_FLAGS) -c $(KERNEL_SRC) -o $(KERNEL_OBJ)

$(BOOT_OBJ): $(BOOT_SRC) $(KERNEL_OBJ)
	nasm -f elf -dN=$(shell wc -c < $(KERNEL_OBJ)) $(BOOT_SRC) -o $(BOOT_OBJ)

$(LINKED_FILE): $(BOOT_OBJ) $(KERNEL_OBJ) $(LD_SCRIPT)
	ld $(KERNEL_OBJ) $(BOOT_OBJ) -m elf_i386 --verbose -T $(LD_SCRIPT) -o $(LINKED_FILE)

$(CLEANED_FILE): $(LINKED_FILE)
	objcopy -I elf32-i386 -O binary $(LINKED_FILE) $(CLEANED_FILE)



$(IMG): $(CLEANED_FILE)
	dd if=/dev/zero of=$(IMG) bs=1024 count=1440
	dd if=$(CLEANED_FILE) of=$(IMG) conv=notrunc

run: $(IMG)
	$(QEMU) $(QEMU_FLAGS) -fda $(IMG)

clean:
	rm -f $(BUILD_FOLDER)/*

debug: $(IMG)
	$(QEMU) $(QEMU_FLAGS) -fda $(IMG) -s -S & gdb

.PHONY: all run clean debug
