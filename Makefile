PREFIX?=/usr
BINDIR=$(PREFIX)/bin

install:
	mkdir -p $(BINDIR)
	install -m755 floating-terminal $(BINDIR)/floating-terminal
	install -m755 term-dmenu $(BINDIR)/term-dmenu
	install -m755 sway-launcher $(BINDIR)/sway-launcher
	install -m755 app-launcher $(BINDIR)/app-launcher
	install -m755 window-switcher $(BINDIR)/window-switcher
uninstall:
	rm -rf $(BINDIR)/floating-terminal
	rm -rf $(BINDIR)/term-dmenu
	rm -rf $(BINDIR)/sway-launcher
	rm -rf $(BINDIR)/app-launcher
	rm -rf $(BINDIR)/window-switcher
