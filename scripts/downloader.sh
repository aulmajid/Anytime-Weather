#!/bin/bash

# Source color definitions
source "$(dirname "$0")/colors.sh"

BIN_DIR="./bin"

download_tool() {
	local TOOL_NAME=$1
	local DOWNLOAD_URL=$2
	local ZIP_INTERNAL_PATH=$3

	local TOOL_PATH="$BIN_DIR/$TOOL_NAME"
	local TEMP_FILE="/tmp/${TOOL_NAME}.zip"

	# Create the bin directory if it doesn't exist
	mkdir -p "$BIN_DIR"

	# Download the tool if it's not already downloaded
	if [ ! -f "$TOOL_PATH" ]; then
		echo "Downloading $TOOL_NAME..."
		curl -LJ "$DOWNLOAD_URL" -o "$TEMP_FILE"
		unzip -o -j "$TEMP_FILE" "$ZIP_INTERNAL_PATH" -d "$BIN_DIR/"
		rm "$TEMP_FILE"
		chmod +x "$TOOL_PATH"
		echo -e "${SUCCESS}$TOOL_NAME has been downloaded in $BIN_DIR${NC}"
	else
		echo -e "${SUCCESS}$TOOL_NAME is already downloaded in $BIN_DIR${NC}"
	fi
}

# The function can be called from other scripts that source this file
