VERSION := $(shell git log --pretty=format:'' | wc -l)

build:
	docker build -t zhijieuam/static-web:$(VERSION) .

push:
	docker login
	docker build -t zhijieuam/static-web:$(VERSION) .
	docker tag zhijieuam/static-web:$(VERSION) zhijieuam/static-web:latest
	docker push zhijieuam/static-web:$(VERSION)
	docker push zhijieuam/static-web:latest

run: push
