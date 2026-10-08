
build/os.elf:     file format elf32-i386

Contents of section .boot:
 7c00 fab8c007 8ed831c0 8ed0bc00 7cbb007e  ......1.....|..~
 7c10 8ec030ed 30f6b102 be050083 fe007433  ..0.0.........t3
 7c20 bf0500b4 02b001cd 1373054f 75f5eb78  .........s.Ou..x
 7c30 8cc083c0 208ec0fe c180f912 7612b101  .... .......v...
 7c40 fec680fe 02720930 f6fec580 fd4f7f58  .....r.0.....O.X
 7c50 4eebc80f 0116837c fc0f20c0 6683c801  N......|.. .f...
 7c60 0f22c0ea 687c0800 eb3e66b8 10000000  ."..h|...>f.....
 7c70 8ed88ed0 8ec08ee0 8ee86683 ec0cea00  ..........f.....
 7c80 7e080017 00907c00 00909090 90909090  ~.....|.........
 7c90 00000000 00000000 ffff0000 0059f300  .............Y..
 7ca0 ffff0000 0049f300 ebfe0000 00000000  .....I..........
 7cb0 00000000 00000000 00000000 00000000  ................
 7cc0 00000000 00000000 00000000 00000000  ................
 7cd0 00000000 00000000 00000000 00000000  ................
 7ce0 00000000 00000000 00000000 00000000  ................
 7cf0 00000000 00000000 00000000 00000000  ................
 7d00 00000000 00000000 00000000 00000000  ................
 7d10 00000000 00000000 00000000 00000000  ................
 7d20 00000000 00000000 00000000 00000000  ................
 7d30 00000000 00000000 00000000 00000000  ................
 7d40 00000000 00000000 00000000 00000000  ................
 7d50 00000000 00000000 00000000 00000000  ................
 7d60 00000000 00000000 00000000 00000000  ................
 7d70 00000000 00000000 00000000 00000000  ................
 7d80 00000000 00000000 00000000 00000000  ................
 7d90 00000000 00000000 00000000 00000000  ................
 7da0 00000000 00000000 00000000 00000000  ................
 7db0 00000000 00000000 00000000 00000000  ................
 7dc0 00000000 00000000 00000000 00000000  ................
 7dd0 00000000 00000000 00000000 00000000  ................
 7de0 00000000 00000000 00000000 00000000  ................
 7df0 00000000 00000000 00000000 000055aa  ..............U.
Contents of section .kernel:
 7e00 83ec0c66 c7050080 0b000000 e897feff  ...f............
 7e10 ff83c40c c3                          .....           
Contents of section .debug_info:
 0000 4d000000 05000104 00000000 01000000  M...............
 0010 000c0000 00000900 0000007e 00001500  ...........~....
 0020 00000000 00000290 00000001 010d3400  ..............4.
 0030 00000300 04830000 00010306 007e0000  .............~..
 0040 15000000 019c0511 7e000026 00000000  ........~..&....
 0050 00                                   .               
Contents of section .debug_abbrev:
 0000 01110125 0e130b03 1f1b1f11 01120610  ...%............
 0010 17000002 2e013f19 030e3a0b 3b0b390b  ......?...:.;.9.
 0020 3c190113 00000318 00000004 2e013f19  <.............?.
 0030 030e3a0b 3b0b390b 11011206 40187a19  ..:.;.9.....@.z.
 0040 00000548 007d017f 13000000           ...H.}......    
Contents of section .debug_aranges:
 0000 1c000000 02000000 00000400 00000000  ................
 0010 007e0000 15000000 00000000 00000000  .~..............
Contents of section .debug_line:
 0000 50000000 05000400 2a000000 010101fb  P.......*.......
 0010 0e0d0001 01010100 00000100 00010101  ................
 0020 1f010900 00000201 1f020f02 00000000  ................
 0030 00000000 00000515 00050200 7e000014  ............~...
 0040 05033d05 1b060105 03069105 01065902  ..=...........Y.
 0050 04000101                             ....            
Contents of section .debug_str:
 0000 474e5520 43393920 31362e32 2e312032  GNU C99 16.2.1 2
 0010 30323630 38313020 2d6d3332 202d6d6e  0260810 -m32 -mn
 0020 6f2d7373 65202d6d 74756e65 3d67656e  o-sse -mtune=gen
 0030 65726963 202d6d61 7263683d 7838362d  eric -march=x86-
 0040 3634202d 67676462 202d4f67 202d7374  64 -ggdb -Og -st
 0050 643d6339 39202d66 66726565 7374616e  d=c99 -ffreestan
 0060 64696e67 202d666e 6f2d7069 65202d66  ding -fno-pie -f
 0070 6e6f2d73 7461636b 2d70726f 74656374  no-stack-protect
 0080 6f72006b 65726e65 6c5f656e 74727900  or.kernel_entry.
 0090 656e646c 6573735f 6c6f6f70 00        endless_loop.   
Contents of section .debug_line_str:
 0000 6b65726e 656c2e63 002f5573 6572732f  kernel.c./Users/
 0010 69616e2f 556e6976 65727369 74792f4f  ian/University/O
 0020 5300                                 S.              

Disassembly of section .boot:

00007c00 <read_sectors-0x1b>:
    7c00:	fa                   	cli
    7c01:	b8 c0 07 8e d8       	mov    eax,0xd88e07c0
    7c06:	31 c0                	xor    eax,eax
    7c08:	8e d0                	mov    ss,eax
    7c0a:	bc 00 7c bb 00       	mov    esp,0xbb7c00
    7c0f:	7e 8e                	jle    7b9f <read_sectors-0x7c>
    7c11:	c0 30 ed             	shl    BYTE PTR [eax],0xed
    7c14:	30 f6                	xor    dh,dh
    7c16:	b1 02                	mov    cl,0x2
    7c18:	be                   	.byte 0xbe
    7c19:	05                   	.byte 0x5
	...

00007c1b <read_sectors>:
    7c1b:	83 fe 00             	cmp    esi,0x0
    7c1e:	74 33                	je     7c53 <lab_2>
    7c20:	bf                   	.byte 0xbf
    7c21:	05                   	.byte 0x5
	...

00007c23 <read_sectors.read_loop>:
    7c23:	b4 02                	mov    ah,0x2
    7c25:	b0 01                	mov    al,0x1
    7c27:	cd 13                	int    0x13
    7c29:	73 05                	jae    7c30 <read_sectors.success>
    7c2b:	4f                   	dec    edi
    7c2c:	75 f5                	jne    7c23 <read_sectors.read_loop>
    7c2e:	eb 78                	jmp    7ca8 <endless_loop>

00007c30 <read_sectors.success>:
    7c30:	8c c0                	mov    eax,es
    7c32:	83 c0 20             	add    eax,0x20
    7c35:	8e c0                	mov    es,eax
    7c37:	fe c1                	inc    cl
    7c39:	80 f9 12             	cmp    cl,0x12
    7c3c:	76 12                	jbe    7c50 <read_sectors.continue>
    7c3e:	b1 01                	mov    cl,0x1
    7c40:	fe c6                	inc    dh
    7c42:	80 fe 02             	cmp    dh,0x2
    7c45:	72 09                	jb     7c50 <read_sectors.continue>
    7c47:	30 f6                	xor    dh,dh
    7c49:	fe c5                	inc    ch
    7c4b:	80 fd 4f             	cmp    ch,0x4f
    7c4e:	7f 58                	jg     7ca8 <endless_loop>

00007c50 <read_sectors.continue>:
    7c50:	4e                   	dec    esi
    7c51:	eb c8                	jmp    7c1b <read_sectors>

00007c53 <lab_2>:
    7c53:	0f 01 16             	lgdtd  [esi]
    7c56:	83 7c fc 0f 20       	cmp    DWORD PTR [esp+edi*8+0xf],0x20
    7c5b:	c0 66 83 c8          	shl    BYTE PTR [esi-0x7d],0xc8
    7c5f:	01 0f                	add    DWORD PTR [edi],ecx
    7c61:	22 c0                	and    al,al
    7c63:	ea                   	.byte 0xea
    7c64:	68                   	.byte 0x68
    7c65:	7c 08                	jl     7c6f <next+0x7>
	...

00007c68 <next>:
    7c68:	eb 3e                	jmp    7ca8 <endless_loop>
    7c6a:	66 b8 10 00          	mov    ax,0x10
    7c6e:	00 00                	add    BYTE PTR [eax],al
    7c70:	8e d8                	mov    ds,eax
    7c72:	8e d0                	mov    ss,eax
    7c74:	8e c0                	mov    es,eax
    7c76:	8e e0                	mov    fs,eax
    7c78:	8e e8                	mov    gs,eax
    7c7a:	66 83 ec 0c          	sub    sp,0xc
    7c7e:	ea                   	.byte 0xea
    7c7f:	00 7e 08             	add    BYTE PTR [esi+0x8],bh
	...

00007c83 <gdt_descriptor>:
    7c83:	17                   	pop    ss
    7c84:	00 90 7c 00 00 90    	add    BYTE PTR [eax-0x6fffff84],dl
    7c8a:	90                   	nop
    7c8b:	90                   	nop
    7c8c:	90                   	nop
    7c8d:	90                   	nop
    7c8e:	90                   	nop
    7c8f:	90                   	nop

00007c90 <gdt>:
	...
    7c98:	ff                   	(bad)
    7c99:	ff 00                	inc    DWORD PTR [eax]
    7c9b:	00 00                	add    BYTE PTR [eax],al
    7c9d:	59                   	pop    ecx
    7c9e:	f3 00 ff             	repz add bh,bh
    7ca1:	ff 00                	inc    DWORD PTR [eax]
    7ca3:	00 00                	add    BYTE PTR [eax],al
    7ca5:	49                   	dec    ecx
    7ca6:	f3                   	repz
	...

00007ca8 <endless_loop>:
    7ca8:	eb fe                	jmp    7ca8 <endless_loop>
	...
    7dfe:	55                   	push   ebp
    7dff:	aa                   	stos   BYTE PTR es:[edi],al

Disassembly of section .kernel:

00007e00 <kernel_entry>:
    7e00:	83 ec 0c             	sub    esp,0xc
    7e03:	66 c7 05 00 80 0b 00 	mov    WORD PTR ds:0xb8000,0x0
    7e0a:	00 00 
    7e0c:	e8 97 fe ff ff       	call   7ca8 <endless_loop>
    7e11:	83 c4 0c             	add    esp,0xc
    7e14:	c3                   	ret
