#!/bin/bash

# help text
help() {
	echo "update.sh - Updates sys-backup script in cron"
}

# Check if script is run by root
is_root() {
	if [[ $USER == "root" ]]; then
		return 1
	else
		return 0
	fi
}

update_scripts() {
	# Update frequencies (available options are "hourly" "daily" "weekly" "monthly")
	FREQUENCIES=("daily" "weekly" "monthly")

	for freq in "${FREQUENCIES[@]}"; do
		echo -e "Updating cron.${freq}..."
		sed 's/$BACKUP_TYPE/"'$freq'"/g' sys-backup > /etc/cron.$freq/sys-backup
		chmod a+x /etc/cron.$freq/sys-backup
	done
}

main() {
	# only run if root
	if is_root; then
		echo "ERROR: Must be run as root"
		help
		exit 1
	fi

	# Update scripts
	update_scripts
}

main $@
