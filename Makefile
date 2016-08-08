prefix := /usr
localstatedir := /var
sysconfdir := /etc
bindir := $(prefix)/bin
datadir := $(prefix)/share
initrddir := $(sysconfdir)/rc.d/init.d
libexecdir := $(prefix)/libexec
mandir := $(prefix)/share/man



_default:
	@echo "No default. Try 'make install'"

install:
	# Install executables
	install -d $(DESTDIR)/$(libexecdir)/rsv
	cp -r libexec/probes $(DESTDIR)/$(libexecdir)/rsv/
	cp -r libexec/metrics $(DESTDIR)/$(libexecdir)/rsv/
	# Install configuration
	install -d $(DESTDIR)/$(sysconfdir)/rsv/meta
	cp -r etc/meta/metrics $(DESTDIR)/$(sysconfdir)/rsv/meta/
	cp -r etc/metrics $(DESTDIR)/$(sysconfdir)/rsv/
	#Install condor-cron configs
	install -d $(DESTDIR)/$(sysconfdir)/condor-cron/config.d
	cp -r etc/condor-cron/config.d $(DESTDIR)/$(sysconfdir)/condor-cron

.PHONY: _default install

