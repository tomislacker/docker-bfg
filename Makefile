BFG_VERSION := 1.12.14

IMAGE_REPO  := tomislacker/bfg
IMAGE_TAG   := $(BFG_VERSION)
IMAGE       := $(IMAGE_REPO):$(BFG_VERSION)

.DEFAULT_GOAL : install

.PHONY	  : container
container :
	@docker build \
		--build-arg BFG_VERSION=$(BFG_VERSION) \
		--tag $(IMAGE) \
		.

.PHONY	  : install
install	  : container
	@echo Add this alias to your profile
	@echo alias bfg=\'docker run --rm -v $$(readlink -m $$(pwd)):/code -w /code $(IMAGE)\'
