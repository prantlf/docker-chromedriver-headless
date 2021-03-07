clean ::
	docker image rm chromedriver-headless:86

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/bin/hadolint.yaml \
		-e XDG_CONFIG_HOME=/bin hadolint/hadolint \
		< Dockerfile

build ::
	docker build -t chromedriver-headless:86 .

shell ::
	docker run --rm -it --entrypoint=busybox chromedriver-headless:86 sh

run ::
	docker run --rm -it -p 4444:4444 chromedriver-headless:86

start ::
	docker run --rm -d --name chromedriver -p 4444:4444 chromedriver-headless:86

stop ::
	docker kill chromedriver

show ::
	docker logs chromedriver

tag ::
	docker tag chromedriver-headless:86 prantlf/chromedriver-headless:86

login ::
	docker login --username=prantlf

push ::
	docker push prantlf/chromedriver-headless:86
