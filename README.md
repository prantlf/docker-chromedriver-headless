# prantlf/chromedriver-headless

[Docker] image: Chromium and ChromeDriver for headless tests on Alpine Linux

[![prantlf/chromedriver-headless](http://dockeri.co/image/prantlf/chromedriver-headless)](https://hub.docker.com/repository/docker/prantlf/chromedriver-headless/)

[This image] is supposed to help testing browser applications in [headless Chromium] driven by `chromedriver`. This image is built automatically on the top of the tag `latest` from the [Alpine repository], so that it is always based on the latest [Alpine Linux]. [Chromium] and `chromedriver` have to be updated from time to time by triggering a new build manually.

## Tags

- [`latest`]

## Install

    docker pull prantlf/chromedriver-headless

## Use

Run the container in the foreground:

    docker run --rm -it -p 4444:4444 chromedriver-headless

Run the container in the background before you start testing:

    docker run --rm -d --name chromedriver -p 4444:4444 chromedriver-headless

Inspect the logging on the console:

    docker logs chromedriver

Stop and remove the container after you stopped testing:

    docker kill chromedriver

You can include this image in a `docker-compose.yml` for [docker-compose] too:

```yaml
version: 3.8
services:
  chromedriver:
    image: prantlf/chromedriver-headless
    init: true
    tmpfs: /tmp
    ports:
      - 127.0.0.1:4444:4444
```

ChromeDriver will start with the following parameters by default:

    --host=0.0.0.0 --port=4444 -whitelisted-ips=

All available command-line arguments for the `chromedriver` executable, which
you can append to the statement running the dockjer container:

    --port=PORT           port to listen on
    --adb-port=PORT       adb server port
    --log-path=FILE       write server log to file instead of stderr, increases
                          log level to INFO
    --log-level=LEVEL     set log level: ALL, DEBUG, INFO, WARNING, SEVERE, OFF
    --verbose             log verbosely (equivalent to --log-level=ALL)
    --silent              log nothing (equivalent to --log-level=OFF)
    --append-log          append log file instead of rewriting
    --replayable          (experimental) log verbosely and don't truncate long
                          strings so that the log can be replayed.
    --url-base            base URL path prefix for commands, e.g. wd/url
    --readable-timestamp  add readable timestamps to log
    --whitelisted-ips     comma-separated whitelist of remote IP addresses
                          which are allowed to connect to ChromeDriver

Chromium will start with the following parameters by default:

```sh
#!/bin/sh
/usr/bin/chromium-browser --headless --no-sandbox \
  --disable-dev-shm-usage --remote-debugging-port=9876 $*
```

If you want to change the parameters, write your own script and map it using
a volume when running the containerL

    -v="my-google-chrome:/usr/bin/google-chrome"

## Build, Test and Publish

The local image is built as `chromedriver-headless` and pushed to the docker hub with the tag `prantlf/chromedriver-headless:latest`.

Remove an old local image:

    make clean

Build and tag new local images:

    make build

Enter an interactive shell inside the latest created image:

    make shell

Tag the local image for pushing:

    make tag

Login to the docker hub:

    make login

Push the local image to the docker hub:

    make push

## License

Copyright (c) 2020 Ferdinand Prantl

Licensed under the MIT license.

[Docker]: https://www.docker.com/
[This image]: https://hub.docker.com/repository/docker/prantlf/chromedriver-headless
[`latest`]: https://hub.docker.com/repository/docker/prantlf/chromedriver-headless/tags
[headless Chromium]: https://chromium.googlesource.com/chromium/src/+/lkgr/headless/README.md
[Chromium]: https://www.chromium.org/
[Alpine Linux]: https://alpinelinux.org/
[docker-compose]: https://docs.docker.com/compose/
