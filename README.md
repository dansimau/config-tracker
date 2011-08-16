## About

config-tracker is a way of keeping track of changes to server configuration files (or any files). It will periodically check for changes to `/etc` (and other defineable locations), store those changes in git and email a notification to the server admins.

## Quick-start

### Download

	cd /usr/local
	git clone git://github.com/dansimau/config-tracker.git config-tracker

### Configure

Edit the configuration file to review the defaults and change the email address that notifications will be sent to:

	vim /usr/local/config-tracker/config-tracker.conf

Optionally configure the files that are being tracked:

	vim /usr/local/config-tracker/include.conf

### Install

Run `init` to initialise and configure the repository. This will also install a crontab entry into `/etc/cron.d/config-tracker` and do an initial sync and commit of all the files you are going to track.

	/usr/local/config-tracker init

And you're done. By default, an update will be run every 10 minutes from cron and a notification email will be sent with a summary of changes to any files.

### Test it yourself

Make some changes to some files and then manually run an `update` to sync and commit all the changed files:

	/usr/local/config-tracker update

You should receive an email with a summary of the changes:

	To: dsimmons@squiz.co.uk
	Subject: [config tracker] shared-php5 commit: d234d1e - etc/foo
	Date: Fri, 12 Aug 2011 19:14:14 +0100 (BST)
	From: root@shared-php5.squiz.co.uk (root)
	
	commit d234d1eff3587bfaee20f821f6c0653ef5db7ddf
	Author: root <root@shared-php5.(none)>
	Date:   Fri Aug 12 19:14:14 2011 +0100
	
	    M	etc/foo
	
	diff --git a/etc/foo b/etc/foo
	index e69de29..3e20166 100644
	--- a/etc/foo
	+++ b/etc/foo
	@@ -0,0 +1 @@
	+# changed my config file yeah

### Editing the email

You can change the notification email by modifying the file `contrib/post-commit`:

	vim /usr/local/config-tracker/contrib/post-commit

And then run an `init` to reinstall the post-commit hook (this is not harmful):

	/usr/local/config-tracker/config-tracker init

## Requirements

 * bash 3+
 * rsync
 * git

