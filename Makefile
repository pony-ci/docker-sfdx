
image_build:
	docker image build --build-arg CACHEBUST=$(shell date +%s) -t ponyci/sfdx:$(tag) -t ponyci/sfdx:latest .

