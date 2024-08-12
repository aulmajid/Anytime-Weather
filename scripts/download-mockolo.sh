#!/bin/bash
source "$(dirname "$0")/downloader.sh"

download_tool \
	"mockolo" \
	"https://github.com/uber/mockolo/releases/latest/download/mockolo.artifactbundle.zip" \
	"mockolo.artifactbundle/mockolo/macos/mockolo"
