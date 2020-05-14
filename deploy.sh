#!/bin/bash
set -e

gimme-aws-creds

echo "Switching to master branch..."
git checkout master

echo "Uploading files..."
# To support emojis, we need to explicitly set the content-type when copying the HTML files.
aws --profile Sandbox_Clio_Developer \
  s3 cp ./public s3://z-hackathon-overproofed/ --recursive --exclude "*" --include "*.html" --content-type "text/html; charset=utf-8"

aws --profile Sandbox_Clio_Developer \
  s3 cp ./public/assets s3://z-hackathon-overproofed/assets --recursive
