#!/bin/bash

# Source color definitions
source "$(dirname "$0")/colors.sh"

# Define paths
MOCKOLO_PATH="./bin/mockolo"
SOURCE_DIR="./Sources"
OUTPUT_FILE="./Tests/GeneratedMocks.swift"

# Check if Mockolo exists
if [ ! -f "$MOCKOLO_PATH" ]; then
	echo -e "${ERROR}Error: Mockolo not found. Please run 'scripts/download-mockolo.sh' to download it.${NC}"
	exit 1
fi

# Create the output directory if it doesn't exist
mkdir -p "$(dirname "$OUTPUT_FILE")"

# Run Mockolo
echo "Generating mocks..."
"$MOCKOLO_PATH" \
	--sourcedirs "$SOURCE_DIR" \
	--destination "$OUTPUT_FILE" \
	--testable-imports "AnytimeWeather" \
	--custom-imports "Foundation" \
	--allow-set-call-count \
	--mock-final \
	--enable-args-history \
	--exclude-suffixes "Tests" "Mocks"

# Check if Mockolo ran successfully
if [ $? -eq 0 ]; then
	echo -e "${SUCCESS}Mocks generated successfully at $OUTPUT_FILE${NC}"
else
	echo -e "${ERROR}Error generating mocks${NC}"
	exit 1
fi
