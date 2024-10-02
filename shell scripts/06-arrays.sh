#!/bin/bash

FRUIT=("Mango" "Banana" "Apple" "Pomogranate") # This is Array
# In Arrays numbers will start from 0 hence ${FRUIT[0]} will be Mango (first one in the array)

echo "First fruit is :: ${FRUIT[0]}"
echo "Second fruit is :: ${FRUIT[1]}"
echo "Third fruit is :: ${FRUIT[2]}"
echo "Fourth fruit is :: ${FRUIT[3]}"

echo "All fruits are :: ${FRUIT[@]}"
