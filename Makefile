VERSION = 1.7.1

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

.PHONY: test
#-------------------------------------------------------------------------------

clean:
	@vagrant destroy -f

rmbox:
	@rm -f $(BOX)

.PHONY: clean rmbox
#-------------------------------------------------------------------------------
