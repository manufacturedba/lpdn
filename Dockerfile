FROM golang:alpine

ENV TERRAFORM_VERSION=1.8.2
ARG RESOURCE_GROUP_NAME=${RESOURCE_GROUP_NAME}

RUN apk add --update gcc git bash openssh py3-pip python3-dev musl-dev \ 
    linux-headers libffi-dev openssl-dev cargo

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

WORKDIR /app

RUN pip3 install azure-cli --break-system-packages

COPY . .

ENTRYPOINT ./entrypoint.sh