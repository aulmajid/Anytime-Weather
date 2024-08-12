#!/bin/bash

# Source color definitions if SRCROOT is not set
if [ -z "$SRCROOT" ]; then
	source "$(dirname "$0")/colors.sh"
	SRCROOT="$(pwd)"
fi

SWIFTLINT_PATH="${SRCROOT}/bin/swiftlint"

# Check if SwiftLint exists
if [ ! -f "$SWIFTLINT_PATH" ]; then
	echo -e "${ERROR}Error: SwiftLint not found. Please run 'scripts/download-swiftlint.sh' to download it.${NC}"
	exit 1
fi

# Run SwiftLint on the project
echo "Running SwiftLint..."
"$SWIFTLINT_PATH" lint
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}SwiftLint completed successfully.${NC}"
else
	echo -e "${ERROR}Error: SwiftLint found issues.${NC}"
	exit 1
fi
