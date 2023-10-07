#!/usr/bin/env bash
for d in day*; do
(
    cd $d
    echo -e "\n----- $d -----"
    uiua run
)
done