#!/bin/bash

# Check if URL is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <bit.ly URL>"
    exit 1
fi

# Get the bit.ly URL from the first argument
BITLY_URL=$1

# Use curl to get the headers and extract the location field
REAL_URL=$(curl -sI $BITLY_URL | grep -i "location:" | cut -d' ' -f2 | tr -d '\r')

# Check if the real URL was found
if [ -z "$REAL_URL" ]; then
    echo "Unable to find the real address."
    exit 1
fi

# Output the real URL
echo "$REAL_URL"
