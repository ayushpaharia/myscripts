#!/bin/bash

# Check if arguments are provided
if [ $# -lt 2 ]; then
  echo "Usage: $0 <user-name> <user-email>"
  exit 1
fi

# Set global Git configurations
git config --global user.name "$1"
git config --global user.email "$2"

# Confirm the new configurations
echo "Git global configurations updated:"
echo "User Name: $(git config --global user.name)"
echo "User Email: $(git config --global user.email)"

