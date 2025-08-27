#!/bin/bash
set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}Starting container test...${NC}"

# Create scratch directory if it doesn't exist
if [[ ! -d "./scratch" ]]; then
    echo -e "${YELLOW}Creating scratch directory...${NC}"
    mkdir -p scratch
fi

# Clone or update ripgrep repo
if [[ ! -d "./scratch/ripgrep" ]]; then
    echo -e "${YELLOW}Cloning ripgrep repository...${NC}"
    git clone https://github.com/BurntSushi/ripgrep.git ./scratch/ripgrep
else
    echo -e "${YELLOW}Updating ripgrep repository...${NC}"
    cd ./scratch/ripgrep
    git fetch origin
    git reset --hard origin/master
    cd ../..
fi

# Build the container with linux/amd64 platform
echo -e "${YELLOW}Building container image...${NC}"
podman build --platform=linux/amd64 -t scip-rust-test .

# Run the container against the ripgrep codebase
echo -e "${YELLOW}Running scip-rust against ripgrep codebase...${NC}"
podman run --platform=linux/amd64 --rm -v "./scratch/ripgrep:/workspace:z" scip-rust-test \
    /usr/local/bin/scip-rust /workspace

echo -e "${GREEN}Container test completed successfully!${NC}"
