#!/bin/bash

# Database connection parameters
USERNAME="postgres"
DATABASE="postgres"
DUMP_DIR="/path/to/dump_directory"

# Loop through and restore each table
for DUMP_FILE in $DUMP_DIR/*.sql; do
  # Extract table name from the dump file (assuming the file name format is TABLENAME.sql)
  TABLE=$(basename "$DUMP_FILE" .sql)

  # Restore the table from the dump file
  psql -U $USERNAME -d $DATABASE -f "$DUMP_FILE"


done
