VERSION = `cat version.txt | xargs`

BOXES = /opt/vagrant/boxes
BOX = $(BOXES)/docker_$(VERSION).box

#-------------------------------------------------------------------------------

all: build

#-------------------------------------------------------------------------------

build: testdir
	@vagrant up
	@vagrant package --output $(BOX)

testdir:
	@touch $(BOXES)/foo
	@rm $(BOXES)/foo

print-box:
	@echo $(BOX)

.PHONY: build print-box testdir
#-------------------------------------------------------------------------------
