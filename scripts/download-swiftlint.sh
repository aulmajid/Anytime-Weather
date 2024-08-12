#!/bin/bash
source "$(dirname "$0")/downloader.sh"

download_tool \
	"swiftlint" \
	"https://github.com/realm/SwiftLint/releases/latest/download/portable_swiftlint.zip" \
	"swiftlint"
