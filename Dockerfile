FROM dtzar/helm-kubectl:3.1.2

RUN apk add --update \
    python \
    py-requests \
    && rm -rf /var/cache/apk/*
