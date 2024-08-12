#!/bin/bash

# Source color definitions if SRCROOT is not set
if [ -z "$SRCROOT" ]; then
	source "$(dirname "$0")/colors.sh"
	SRCROOT="$(pwd)"
fi

SWIFTFORMAT_PATH="${SRCROOT}/bin/swiftformat"
SWIFTLINT_PATH="${SRCROOT}/bin/swiftlint"

# Check if SwiftFormat and SwiftLint exist
source "$(dirname "$0")/check-tool.sh"
check_tool "$SWIFTFORMAT_PATH" "SwiftFormat" "swiftformat"
check_tool "$SWIFTLINT_PATH" "SwiftLint" "swiftlint"

# Run SwiftFormat
echo "Running SwiftFormat..."
"$SWIFTFORMAT_PATH" "$SRCROOT" --lint
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}SwiftFormat has finished checking your code.${NC}"
else
	echo -e "${ERROR}Error: SwiftFormat encountered issues.${NC}"
	exit 1
fi

# Run SwiftLint
echo "Running SwiftLint..."
"$SWIFTLINT_PATH" lint
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}SwiftLint completed successfully.${NC}"
else
	echo -e "${ERROR}Error: SwiftLint found issues.${NC}"
	exit 1
fi

echo -e "${SUCCESS}All checks completed successfully.${NC}"
