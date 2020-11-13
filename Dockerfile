FROM alpine:3.12

RUN apk add --update --no-cache curl jq bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
