#!/bin/ash

backups=/backups

mkdir -p "$backups"

# Back them up
db_backup="${backups}/${PGNAME}-$( date "+%Y-%m-%dT%H%M" )"
mkdir -p "${db_backups}"
echo "Backing up ${PGNAME} to ${db_backup}"
pg_dump ${PG_DUMP_FLAGS} --no-password --file "${db_backup}" "${PGNAME}"

# Remove backups older than 14 days
find "${db_backups}" -mtime "+${BACKUP_KEEP_DAYS}" -delete

echo "Done"
