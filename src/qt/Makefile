.PHONY: FORCE
all: FORCE
	$(MAKE) -C .. bitcash_qt 
clean: FORCE
	$(MAKE) -C .. bitcash_qt_clean test_bitcash_qt_clean
check: FORCE
	$(MAKE) -C .. test_bitcash_qt_check
bitcash-qt bitcash-qt.exe: FORCE
	 $(MAKE) -C .. bitcash_qt
