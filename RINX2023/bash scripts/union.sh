#!/bin/bash

USERNAME="postgres"
DATABASE="postgres"

echo "Script started at $(date)"
for i in "/pgdata/rinx/scripts/union/"*
do
    # Extract the table name from the file name
    table_name=$(basename "$i" .sql)

    # Check if the table exists before attempting to drop it
    if psql -U "$USERNAME" -d "$DATABASE" -c "SELECT 1 FROM $table_name LIMIT 1" 2>/dev/null; then
        # Table exists, so drop it
        psql -U "$USERNAME" -d "$DATABASE" -c "DROP TABLE $table_name"
        echo "Table $table_name dropped."
    else
        echo "Table $table_name does not exist. Skipping drop operation."
    fi

    # Execute the SQL script
    psql -U "$USERNAME" -d "$DATABASE" -f "$i"
done
echo "Script finished at $(date)"
wait