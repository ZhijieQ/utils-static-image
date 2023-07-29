VERSION := $(shell git log --pretty=format:'' | wc -l)

build:
	docker build -t zhijieuam/static-web:$(VERSION) .
	docker build -t zhijieuam/static-web-arm:$(VERSION) . -f Dockerfile-arm

push:
	docker login
	docker build -t zhijieuam/static-web:$(VERSION) .
	docker tag zhijieuam/static-web:$(VERSION) zhijieuam/static-web:latest
	docker push zhijieuam/static-web:$(VERSION)
	docker push zhijieuam/static-web:latest

	docker build -t zhijieuam/static-web-arm:$(VERSION) . -f Dockerfile-arm
	docker tag zhijieuam/static-web-arm:$(VERSION) zhijieuam/static-web-arm:latest
	docker push zhijieuam/static-web-arm:$(VERSION)
	docker push zhijieuam/static-web-arm:latest

run: push
