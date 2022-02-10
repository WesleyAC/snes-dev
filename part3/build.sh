#!/usr/bin/env sh

set -e

cd "$(dirname "$0")"

mkdir -p out
ca65 ./src/main.asm -o ./out/main.o -g
ld65 -C ./src/lorom.cfg -o ./out/main.sfc ./out/main.o
