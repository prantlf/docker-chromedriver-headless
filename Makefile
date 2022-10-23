clean ::
	docker image rm chromedriver-headless prantlf/chromedriver-headless registry.gitlab.com/prantlf/docker-chromedriver-headless

lint ::
	docker run --rm -i \
		-v "${PWD}"/.hadolint.yaml:/.config/hadolint.yaml  \
		hadolint/hadolint < Dockerfile

build ::
	docker build -t chromedriver-headless .
	docker tag chromedriver-headless prantlf/chromedriver-headless
	docker tag chromedriver-headless registry.gitlab.com/prantlf/docker-chromedriver-headless

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

login ::
	docker login --username=prantlf
	docker login registry.gitlab.com --username=prantlf

pull ::
	docker pull prantlf/chromedriver-headless
	docker pull registry.gitlab.com/prantlf/docker-chromedriver-headless

push ::
	docker push prantlf/chromedriver-headless
	docker push registry.gitlab.com/prantlf/docker-chromedriver-headless
	docker tag prantlf/chromedriver-headless prantlf/chromedriver-headless:102
	docker push prantlf/chromedriver-headless:102
	docker tag registry.gitlab.com/prantlf/docker-chromedriver-headless registry.gitlab.com/prantlf/docker-chromedriver-headless:102
	docker push registry.gitlab.com/prantlf/docker-chromedriver-headless:102
