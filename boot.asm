[BITS 16]
[ORG 0x7C00]

%ifndef N
%define N 512
%endif

cli ; stack setup
cld
xor ax, ax
mov ds, ax
mov ss, ax
mov sp, 0x7C00
sti

mov bx, 0x7E00 ; offset = 0x7E00
mov es, ax ; base = 0

; chs setup
xor ch, ch ; c = 0
xor dh, dh ; h = 0
mov cl, 2  ; s = 2

mov si, (N + 511) / 512 ; si = sectors to read in total

.read_sectors:
cmp si, 0
je .end_loop

;mov di, 5 ; retry read loop
;.read_loop:
mov ah, 0x2 ; read sectors from drive
mov al, 1   ; hm read at once
int 0x13
;jnc .success
;dec di
;jnz .read_loop
;jmp .end_loop

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

.continue:
dec si
jmp .read_sectors

.end_loop:
  jmp .end_loop

times 510-($-$$) db 0
dw 0xAA55
