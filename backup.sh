#!/bin/bash

# Check if there are two arguments
if [ $# -ne 2 ]; then
	echo "Usage: backup.sh <source_dir> <target_dir>"
	echo "Please try again."
	exit 1
fi

# Check if rsync is installed
if ! command -v rsync &> /dev/null; then
	echo "This script requires rsync to be installed."
	echo "Please install it and try again."
	exit 2
fi

# Get date in format YYYY-MM-DD
current_date=$(date +%Y-%m-%d)

# --dry-run to test
rsync_options="-avb --backup-dir $2/$current_date --delete --dry-run"

$(which rsync) $rsync_options $1 $2/current >> log/backup_$current_date.log
