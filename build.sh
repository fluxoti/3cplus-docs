#!/bin/bash

if [ -z $SWAGGER_SPEC_URL ]; then
    echo "You need to set the SWAGGER_SPEC_URL env variable"
    exit 1
fi

if [ -z $CI_BUILD_TAG ]; then
    CI_BUILD_TAG=latest
fi

sed -i "s|http://petstore.swagger.io/v2/swagger.json|$SWAGGER_SPEC_URL|g" dist/index.html
docker build -t swagger:$CI_BUILD_TAG .

