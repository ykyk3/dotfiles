#!/bin/bash

set -e

# Colors for output
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${GREEN}Starting dotfiles setup...${NC}"

# Function to check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Install chezmoi if not present
if ! command_exists chezmoi; then
    echo -e "${YELLOW}Installing chezmoi...${NC}"
    
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        if command_exists brew; then
            brew install chezmoi
        else
            sh -c "$(curl -fsLS get.chezmoi.io)"
        fi
    else
        # Linux/WSL/Windows
        sh -c "$(curl -fsLS get.chezmoi.io)"
    fi
fi

# Initialize chezmoi (this will run all the setup scripts automatically)
echo -e "${YELLOW}Initializing dotfiles...${NC}"
chezmoi init --apply ykyk3

echo -e "${GREEN}Setup complete!${NC}"
echo -e "${YELLOW}Please restart your terminal to apply all changes.${NC}"
echo -e "\n${YELLOW}Note: All tools and packages will be installed automatically by chezmoi scripts.${NC}"