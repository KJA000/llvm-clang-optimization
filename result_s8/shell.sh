#!/bin/bash

ITERATIONS=1000

COMMAND="./test_arm_convolve_s8"

for ((i=1; i<=$ITERATIONS; i++)); do
    OUTPUT=$($COMMAND | grep "Runtime:" | awk '{print $2}')
    echo "$OUTPUT"
done

