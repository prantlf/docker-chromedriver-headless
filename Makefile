clean ::
	docker image rm chromedriver-headless

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile

build ::
	docker build -t chromedriver-headless .

shell ::
	docker run --rm -it --entrypoint=busybox chromedriver-headless sh

run ::
	docker run --rm -it -p 4444:4444 chromedriver-headless

start ::
	docker run --rm -d --name chromedriver -p 4444:4444 chromedriver-headless

stop ::
	docker kill chromedriver

show ::
	docker logs chromedriver

tag ::
	docker tag chromedriver-headless prantlf/chromedriver-headless:latest

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/chromedriver-headless:latest

version :: build
	#docker tag chromedriver-headless prantlf/chromedriver-headless:$(VERSION)
	docker push prantlf/chromedriver-headless:$(VERSION)
