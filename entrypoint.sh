#!/bin/sh 

set -e

mkdir -p ~/.aws

touch ~/.aws/credentials

echo "[default]
aws_access_key_id = ${S3_ACCESS_KEY_ID}
aws_secret_access_key = ${S3_SECRET_ACCESS_KEY}" > ~/.aws/credentials

aws s3 cp ${FILE} s3://${S3_BUCKET}/ --region=${S3_REGION} --endpoint-url=${S3_ENDPOINT_URL} --cli-connect-timeout 6000 $*

rm -rf ~/.aws

