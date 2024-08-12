#!/bin/bash

# Source color definitions
source "$(dirname "$0")/colors.sh"

# Define directories and file paths
BIN_DIR="./bin"
SWIFTLINT_PATH="$BIN_DIR/swiftlint"
TEMP_FILE="/tmp/swiftlint.zip"

# Create the bin directory if it doesn't exist
if [ ! -d "$BIN_DIR" ]; then
	echo "Creating bin directory..."
	mkdir -p "$BIN_DIR"
fi

# Download SwiftLint if it's not already downloaded
if [ ! -f "$SWIFTLINT_PATH" ]; then
	echo "Downloading SwiftLint..."
	curl -LJ https://github.com/realm/SwiftLint/releases/latest/download/portable_swiftlint.zip \
		-o "$TEMP_FILE"

	unzip -o -j "$TEMP_FILE" swiftlint -d "$BIN_DIR/"
	rm "$TEMP_FILE"
	chmod +x "$SWIFTLINT_PATH"
	echo -e "${SUCCESS}SwiftLint has been downloaded in $BIN_DIR${NC}"
else
	echo -e "${SUCCESS}SwiftLint is already downloaded in $BIN_DIR${NC}"
fi
