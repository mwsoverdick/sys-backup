
# sys-backup
A simple 2-script automatic backup setup tool for Linux systems.

## Features
* Can do hourly, daily, weekly, and monthly backups.
* Backs up entire rootfs (except for `tmp` and other unnecessary folders)
* 3-step setup.

## Usage
### Setup
1. Edit `sys-backup`
	* Set the `$FOLDER` variable to the path of your backup folder. 
2. Edit `update.sh`
	* Set the `FREQUENCIES` list to your desired backup frequencies
3. Run `sudo ./update.sh` to install `sys-backup` to `/etc/cron.*`

### System Restore
From within your desired backup folder, run `sudo rsync -aAXv . PATH_TO_ROOTFS` where `PATH_TO_ROOTFS` is the path to where your rootfs is mounted. 

## Helpful Tips
* Be sure your backup folder is on an _external_ drive, mounted in the `/media` directory to avoid recursive backup loop.
* Be sure that the external drive is in `/etc/fstab` so that it mounts automatically at boot.
* Ensure that your backup drive has sufficient capacity, roughly 4x the capacity of your rootfs device _should_ suffice.

## Contribution
Please contribute if you like.

