include .env
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build:  ## Build docker images
	docker-compose build

test:
	docker-compose run app bash -c "fvm flutter test"

run:  ## Start up applications
	docker-compose up

clean:  ## Remove all images and volumes
	docker-compose down --rmi all --volumes

setup: build
	docker-compose run app bash -c "fvm use --force $(FLUTTER_VERSION)"
	docker-compose run app bash -c "fvm flutter config --enable-web --enable-android --enable-ios"
	docker-compose run app bash -c "fvm flutter doctor -v"

create:
	docker-compose run app bash -c "fvm flutter create ."
	docker-compose run app bash -c "fvm flutter clean"

