#!/bin/bash

# Function to commit changes
commit_changes() {
    git add .
    git commit -m "$1"
    git push origin main
}

# --- Docker Installation ---
echo "Installing Docker..."
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
docker --version
commit_changes "Installed Docker"

# --- Podman Installation ---
echo "Installing Podman..."
sudo apt install -y podman
podman --version
commit_changes "Installed Podman"

