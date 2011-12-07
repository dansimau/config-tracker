PREFIX = /usr/local
ETCDIR = $(PREFIX)/etc

all:

install: all

	install -d $(ETCDIR)/config-tracker
	install -c -m 0644 config-tracker.conf.dist $(PREFIX)/etc/config-tracker/config-tracker.conf
	install -c -m 0644 include.conf $(PREFIX)/etc/config-tracker
	install -c -m 0644 exclude.conf $(PREFIX)/etc/config-tracker

	install -d $(ETCDIR)/cron.d
	install -c -m 0644 contrib/cron $(PREFIX)/etc/cron.d

	install -d $(PREFIX)/share/config-tracker
	install -c -m 0755 contrib/post-commit $(PREFIX)/share/config-tracker

	install -d $(PREFIX)/sbin
	install -c -m 0755 config-tracker $(PREFIX)/sbin

.PHONY: install