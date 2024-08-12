#!/bin/bash

# Source color definitions if SRCROOT is not set
if [ -z "$SRCROOT" ]; then
	source "$(dirname "$0")/colors.sh"
	SRCROOT="$(pwd)"
fi

SWIFTFORMAT_PATH="${SRCROOT}/bin/swiftformat"

# Check if SwiftFormat exists
if [ ! -f "$SWIFTFORMAT_PATH" ]; then
	echo -e "${ERROR}Error: SwiftFormat not found. Please run 'scripts/download-swiftformat.sh' to download it.${NC}"
	exit 1
fi

# Run SwiftFormat on the project
echo "Running SwiftFormat..."
"$SWIFTFORMAT_PATH" --swiftversion 5.0 "$SRCROOT"
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}SwiftFormat has finished formatting your code.${NC}"
else
	echo -e "${ERROR}Error: SwiftFormat encountered issues.${NC}"
	exit 1
fi
