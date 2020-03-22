FROM dtzar/helm-kubectl:3.1.2

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    py-requests \
    && rm -rf /var/cache/apk/*
