VERSION = 1.9.1

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

.PHONY: build testdir print-box
#-------------------------------------------------------------------------------

test:
	@vagrant up
	@vagrant ssh -c "docker run --rm hello-world"
	@vagrant ssh -c "docker version"

dltest:
	@$(MAKE) -C test

.PHONY: test dltest
#-------------------------------------------------------------------------------

clean:
	@vagrant destroy -f

dlclean:
	@$(MAKE) -C test clean

rmbox:
	@rm -f $(BOX)

.PHONY: clean dlclean rmbox
#-------------------------------------------------------------------------------
