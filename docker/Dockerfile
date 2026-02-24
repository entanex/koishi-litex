FROM node:lts-alpine

RUN apk add --no-cache ca-certificates git

RUN git clone --depth 1 https://github.com/entanex/koishi-litex.git /koishi-litex && rm -rf /koishi-litex/.git

COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME ["/koishi"]
WORKDIR "/koishi"
ENTRYPOINT ["/entrypoint.sh"]
CMD ["yarn", "start"]
