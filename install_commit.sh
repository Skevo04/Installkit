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

# --- Kubernetes (kubectl) Installation ---
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
kubectl version --client
commit_changes "Installed kubectl"

echo "All tools installed and committed to Git!"
