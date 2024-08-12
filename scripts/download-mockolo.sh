#!/bin/bash

# Source color definitions
source "$(dirname "$0")/colors.sh"

# Define directories and file paths
BIN_DIR="./bin"
MOCKOLO_PATH="$BIN_DIR/mockolo"
TEMP_FILE="/tmp/mockolo.zip"

# Create the bin directory if it doesn't exist
if [ ! -d "$BIN_DIR" ]; then
	echo "Creating bin directory..."
	mkdir -p "$BIN_DIR"
fi

# Download mockolo if it's not already downloaded
if [ ! -f "$MOCKOLO_PATH" ]; then
	echo "Downloading mockolo..."
	curl -LJ https://github.com/uber/mockolo/releases/latest/download/mockolo.artifactbundle.zip \
		-o "$TEMP_FILE"

	unzip -o -j "$TEMP_FILE" mockolo.artifactbundle/mockolo/macos/mockolo -d "$BIN_DIR/"
	rm "$TEMP_FILE"
	chmod +x "$MOCKOLO_PATH"
	echo -e "${SUCCESS}mockolo has been downloaded in $BIN_DIR${NC}"
else
	echo -e "${SUCCESS}mockolo is already downloaded in $BIN_DIR${NC}"
fi
