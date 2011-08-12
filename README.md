## About

config-tracker is a way of keeping track of changes to server configuration files (or any files). It will periodically check for changes to `/etc` (and other defineable locations), store those changes in git and email a notification to the server admins.

## Quick-start

### Download

	cd /usr/local
	git clone git://github.com/dansimau/config-tracker.git config-tracker

### Configure and install

Optionally configure the files that are being tracked:

	vim /usr/local/config-tracker/include.conf

Run `init` to initialise and configure the repository and install crontab entry into `/etc/cron.d`.

	/usr/local/config-tracker init

### Initial run

Do an initial `update` which will sync and commit all the tracked files:

	/usr/local/config-tracker update

And that's it! By default, an update will be run every 10 minutes from cron.

## Requirements

 * bash
 * rsync
 * git

