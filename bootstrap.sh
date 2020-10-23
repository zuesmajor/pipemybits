#!/bin/bash
set -eux
echo "Building GO Binary"
go build main.go
echo "Built GO binary"
echo "Building Docker Image"
docker build -t image-viewer:1.0.0 .