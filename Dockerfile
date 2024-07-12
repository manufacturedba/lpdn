FROM golang:alpine

ENV TERRAFORM_VERSION=1.8.2
ARG RESOURCE_GROUP_NAME=${RESOURCE_GROUP_NAME}

RUN apk add --update git bash openssh

ENV TF_DEV=true
ENV TF_RELEASE=true

WORKDIR $GOPATH/src/github.com/hashicorp/terraform
RUN git clone https://github.com/hashicorp/terraform.git ./ && \
    git checkout v${TERRAFORM_VERSION} && \
    /bin/bash scripts/build.sh

WORKDIR /app

COPY . .

ENTRYPOINT RESOURCE_GROUP_NAME=$RESOURCE_GROUP_NAME ./entrypoint.sh