FROM alpine:latest
LABEL maintainer="Ferdinand Prantl <prantlf@gmail.com>"

RUN apk --no-cache add chromium chromium-chromedriver
COPY . /

ENTRYPOINT ["chromedriver"]
CMD ["--host=0.0.0.0", "--port=4444", "--whitelisted-ips="]
EXPOSE 4444
