#!/bin/bash
source "$(dirname "$0")/downloader.sh"

download_tool \
	"swiftformat" \
	"https://github.com/nicklockwood/SwiftFormat/releases/latest/download/swiftformat.zip" \
	"swiftformat"
