#!/bin/bash

# Database connection parameters
USERNAME="postgres"
DATABASE="postgres"
DUMP_DIR="/path/to/dump_directory"
variable="tmax"  # Remove spaces around the equal sign

# List tables starting with "tmax"
TABLES=$(psql -U $USERNAME -d $DATABASE -t -c "SELECT table_name FROM information_schema.tables WHERE table_name LIKE '$variable%';")

# Loop through and dump each table
for TABLE in $TABLES; do
  DUMP_FILE="$DUMP_DIR/$TABLE.sql"
  pg_dump -U $USERNAME -d $DATABASE -t "$TABLE" -f "$DUMP_FILE"
done
