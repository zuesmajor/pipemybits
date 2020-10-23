#!/bin/bash
set -eux
echo "Building Docker Image"
docker build -t image-viewer:1.0.0 .
docker run --rm -p 8080:8080 image-viewer:1.0.0