FROM dtzar/helm-kubectl:3.1.2

RUN apk add --no-cache --upgrade bash

RUN echo "**** install Python ****" && \
    apk add --no-cache python3 && \
    if [ ! -e /usr/bin/python ]; then ln -sf python3 /usr/bin/python ; fi && \
    \
    echo "**** install pip ****" && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --no-cache --upgrade pip setuptools wheel && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi
    
RUN apk add --no-cache jq
RUN curl https://sdk.cloud.google.com > install.sh
RUN bash install.sh --disable-prompts
ENV PATH $PATH:/root/google-cloud-sdk/bin

RUN pip3 install websockets
RUN pip3 install nest_asyncio

# RUN apk add --update \
#     python \
#     python-dev \
#     py-pip \
#     py-requests \
#     && rm -rf /var/cache/apk/*
