FROM golang:1.20-bookworm AS builder

ARG HUGO_VERSION=0.91.2
ENV HUGO_ENV=production

RUN apt-get update \
  && apt-get install -y --no-install-recommends ca-certificates curl git \
  && rm -rf /var/lib/apt/lists/*

RUN curl -L -o /tmp/hugo.deb "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_extended_${HUGO_VERSION}_Linux-64bit.deb" \
  && dpkg -i /tmp/hugo.deb \
  && rm /tmp/hugo.deb

WORKDIR /src
COPY . .
RUN hugo --gc --minify

FROM zeabur/caddy-static AS runtime
COPY --from=builder /src/public /usr/share/caddy
