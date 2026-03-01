FROM --platform=$BUILDPLATFORM alpine AS builder
ARG LINK
ARG TARGETPLATFORM
RUN apk add --no-cache wget unzip

RUN ARCH=${TARGETPLATFORM:6} && \
    wget -O /tmp/koishi.zip ${LINK}${ARCH}-node20.zip && \
    mkdir -p /opt/koishi && \
    unzip /tmp/koishi.zip -d /opt/koishi

FROM node:lts-alpine
WORKDIR /koishi

COPY --from=builder /opt/koishi .

EXPOSE 5140

CMD ["yarn", "start"]
