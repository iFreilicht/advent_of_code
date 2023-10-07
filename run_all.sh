#!/usr/bin/env bash
for d in aoc*/day*; do
(
    cd $d
    echo -e "\n----- $d -----"
    uiua run
)
done