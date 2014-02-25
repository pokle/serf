#!/bin/bash

echo
echo "New event: ${SERF_EVENT}. Data follows..."
while read line; do
    printf "PAYLOAD>> ${line}\n"
done
echo ----- ENV ----
env
echo -------- END -----------
