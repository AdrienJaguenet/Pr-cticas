#!/bin/bash

TARGETS=(encaja-e1 encaja-e2-pi encaja-e2-pj encaja-e2-px encaja-e3 encaja-e4-pi encaja-e4-pj encaja-e4-px)

for target in ${TARGETS[@]}; do
	echo "Compilando $target..."
	gcc -o $target $target.c -fopenmp;
done

