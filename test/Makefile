all: test

#-------------------------------------------------------------------------------

test:
	@vagrant up
	@vagrant ssh -c "docker run --rm hello-world"
	@vagrant ssh -c "docker version"

clean:
	@vagrant destroy -f

.PHONY: test clean
#-------------------------------------------------------------------------------
