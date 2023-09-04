build:
	docker build -t test:latest .
run:
	docker run -it --rm --name test -e INTERVAL=3 -v $(shell pwd)/log:/workspace/log test:latest