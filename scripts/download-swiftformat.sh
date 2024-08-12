#!/bin/bash

# Source color definitions
source "$(dirname "$0")/colors.sh"

# Define the directory for the SwiftFormat binary
BIN_DIR="./bin"
SWIFTFORMAT_PATH="$BIN_DIR/swiftformat"

# Create the bin directory if it doesn't exist
if [ ! -d "$BIN_DIR" ]; then
	echo "Creating bin directory..."
	mkdir -p "$BIN_DIR"
fi

# Download SwiftFormat if it's not already downloaded
if [ ! -f "$SWIFTFORMAT_PATH" ]; then
	echo "Downloading SwiftFormat..."
	curl -L https://github.com/nicklockwood/SwiftFormat/releases/latest/download/swiftformat.zip -o swiftformat.zip
	unzip -o swiftformat.zip -d "$BIN_DIR"
	rm swiftformat.zip
	chmod +x "$SWIFTFORMAT_PATH"
	echo -e "${SUCCESS}SwiftFormat has been downloaded in $BIN_DIR${NC}"
else
	echo -e "${SUCCESS}SwiftFormat is already downloaded in $BIN_DIR${NC}"
fi
