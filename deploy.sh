#!/bin/bash
set -u -e;

echo "Get aws utils"
pip -q install awscli

echo "Update S3"
aws s3 sync ./build/web s3://olem.org/codeclicker --quiet --acl public-read