#!/bin/bash

USERNAME="postgres"
DATABASE="postgres"




#!/bin/bash
echo "Script started at $(date)"
for i in "/pgdata/rinx/scripts/union/"*
do
    psql -U "$USERNAME" -d "$DATABASE" -f "$i"
done
echo "Script finished at $(date)"
wait