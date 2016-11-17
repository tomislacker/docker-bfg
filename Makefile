BFG_VERSION := 1.12.14

IMAGE_REPO  := tomislacker/bfg
IMAGE_TAG   := $(BFG_VERSION)
IMAGE       := $(IMAGE_REPO):$(BFG_VERSION)

.PHONY	  : container
container :
	@docker build \
		--build-arg BFG_VERSION=$(BFG_VERSION) \
		--tag $(IMAGE) \
		.
