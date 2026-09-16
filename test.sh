#!/bin/bash

N=$1
make clean
head -c $N /dev/urandom >random_payload.bin
echo "incbin \"random_payload.bin\"" >kernel.asm
make
