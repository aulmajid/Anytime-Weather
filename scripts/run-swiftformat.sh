#!/bin/bash

# Define the directory for the SwiftFormat binary
if [ -z "$SRCROOT" ]; then
	# If SRCROOT is not set, use the current directory
	SRCROOT="$(pwd)"
fi

SWIFTFORMAT_PATH="${SRCROOT}/bin/swiftformat"

# Check if SwiftFormat exists
if [ ! -f "$SWIFTFORMAT_PATH" ]; then
	echo "SwiftFormat not found. Please run 'scripts/download-swiftformat.sh' to download it."
	exit 1
fi

# Run SwiftFormat on the project
echo "Running SwiftFormat..."
"$SWIFTFORMAT_PATH" --swiftversion 5.0 "$SRCROOT"
echo "SwiftFormat has finished formatting your code."
