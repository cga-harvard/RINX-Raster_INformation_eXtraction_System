#!/bin/bash

for i in "/pgdata/rinx/scripts/upload/"*
do
    "$i" &
done

wait