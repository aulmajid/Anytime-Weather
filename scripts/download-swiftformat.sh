#!/bin/bash

# Source color definitions
source "$(dirname "$0")/colors.sh"

# Define directories and file paths
BIN_DIR="./bin"
SWIFTFORMAT_PATH="$BIN_DIR/swiftformat"
TEMP_FILE="/tmp/swiftformat.zip"

# Create the bin directory if it doesn't exist
if [ ! -d "$BIN_DIR" ]; then
	echo "Creating bin directory..."
	mkdir -p "$BIN_DIR"
fi

# Download SwiftFormat if it's not already downloaded
if [ ! -f "$SWIFTFORMAT_PATH" ]; then
	echo "Downloading SwiftFormat..."
	curl -LJ https://github.com/nicklockwood/SwiftFormat/releases/latest/download/swiftformat.zip \
		-o "$TEMP_FILE"

	unzip -o -j "$TEMP_FILE" swiftformat -d "$BIN_DIR/"
	rm "$TEMP_FILE"
	chmod +x "$SWIFTFORMAT_PATH"
	echo -e "${SUCCESS}SwiftFormat has been downloaded in $BIN_DIR${NC}"
else
	echo -e "${SUCCESS}SwiftFormat is already downloaded in $BIN_DIR${NC}"
fi
