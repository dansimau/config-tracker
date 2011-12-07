prefix?=/usr/local

all:

install: all

	install -d $(prefix)/etc/config-tracker
	install -c -m 0644 config-tracker.conf.dist $(prefix)/etc/config-tracker/config-tracker.conf
	install -c -m 0644 include.conf $(prefix)/etc/config-tracker
	install -c -m 0644 exclude.conf $(prefix)/etc/config-tracker

	install -d $(prefix)/etc/cron.d
	install -c -m 0644 contrib/cron $(prefix)/etc/cron.d

	install -d $(prefix)/share/config-tracker
	install -c -m 0755 contrib/post-commit $(prefix)/share/config-tracker

	install -d $(prefix)/sbin
	install -c -m 0755 config-tracker $(prefix)/sbin

.PHONY: install