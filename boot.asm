[BITS 16]

%ifndef N
%define N 512
%endif

%define CODE 8
%define DATA 16 

cli ; stack setup
xor ax, ax
mov ds, ax
mov ss, ax
mov sp, 0x7C00


mov bx, 0x7E00 ; offset = 0x7E00
mov es, ax ; base = 0

; chs setup
xor ch, ch ; c = 0
xor dh, dh ; h = 0
mov cl, 2  ; s = 2

mov si, (N + 511) / 512 ; si = sectors to read in total

read_sectors:
cmp si, 0
je kernel_writen 

mov di, 5 ; retry read loop
.read_loop:
mov ah, 0x2 ; read sectors from drive
mov al, 1   ; hm read at once
int 0x13
jnc .success
dec di
jnz .read_loop
jmp endless_loop 

.success:
mov ax, es
add ax, 0x20
mov es, ax ; es += 0x20 (moved to next 512)

inc cl
cmp cl, 18 ; if (s <= 18)
jbe .continue
mov cl, 1

inc dh
cmp dh, 2 ; if (h <= 2)
jb .continue
xor dh, dh

inc ch
cmp ch, 79
jg endless_loop 

.continue:
dec si
jmp read_sectors


kernel_writen:

; lab 2
lgdt [gdt_descriptor]


cld
; setting PE flag in control register cr0
mov eax, cr0
or eax, 1
mov cr0, eax

jmp CODE:next

[BITS 32]
next:
  mov ax, DATA
  mov ds, ax
  mov ss, ax
  mov es, ax
  mov fs, ax
  mov gs, ax 

; aligning the stack
sub esp, 6

[EXTERN kernel_entry]
jmp CODE:kernel_entry


; data selector
data_selector:
  dw 0b10000

gdt_descriptor:
  dw 0x17
  dd gdt

align 8
gdt:
  ; null decs
  dw 0x0000
  dw 0x0000
  dw 0x0000
  dw 0x0000

  ; code desc
  dw 0xFFFF ; Limit 0-15
  dw 0x0000 ; Base 0-15
  db 0x00 ; Base 16-23
  db 0b10011010 ; P, DPL 0-1, S, EF, C, R, A
  db 0b11001111 ; G, D, 0, AVL, Limit 16-19
  db 0x00 ; Base 24-31

  ; data desc
  dw 0xFFFF ; Limit 0-15
  dw 0x0000 ; Base 0-15
  db 0x00 ; Base 16-23
  db 0b10010010 ; P, DPL 0-1, S, EF, C, R, A
  db 0b11001111 ; G, D, 0, AVL, Limit 16-19
  db 0x00 ; Base 24-31


[GLOBAL endless_loop]
endless_loop:
  jmp endless_loop 

times 510-($-$$) db 0
dw 0xAA55
