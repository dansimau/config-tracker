PREFIX = /usr/local
ETCDIR = $(PREFIX)/etc

all:

install: all

	install -d $(ETCDIR)/config-tracker
	install -c -m 0644 config-tracker.conf.dist $(ETCDIR)/config-tracker/config-tracker.conf
	install -c -m 0644 include.conf $(ETCDIR)/config-tracker
	install -c -m 0644 exclude.conf $(ETCDIR)/config-tracker

	install -d $(ETCDIR)/cron.d
	install -c -m 0644 contrib/cron $(ETCDIR)/cron.d

	install -d $(PREFIX)/share/config-tracker
	install -c -m 0755 contrib/post-commit $(PREFIX)/share/config-tracker

	install -d $(PREFIX)/sbin
	install -c -m 0755 config-tracker $(PREFIX)/sbin

.PHONY: install