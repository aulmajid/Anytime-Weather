#!/bin/bash

check_tool() {
	local tool_path="$1"
	local tool_name="$2"
	local download_script="$3"

	if [ ! -f "$tool_path" ]; then
		echo -e "${ERROR}Error: $tool_name not found. Please run 'scripts/$download_script' to download it.${NC}"
		exit 1
	fi
}
