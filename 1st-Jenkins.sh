#!/bin/bash

# Update system
sudo apt update -y

# Install required dependencies
sudo apt install -y fontconfig openjdk-17-jdk ca-certificates curl gnupg

# Create keyring directory
sudo install -m 0755 -d /usr/share/keyrings

# Download NEW Jenkins GPG key (2024+ official)
curl -fsSL https://pkg.jenkins.io/public-keys/jenkins-keyring.asc \
  | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null

# Add Jenkins repository (correct repo format)
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ \
  | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list
sudo apt update -y

# Install Jenkins
sudo apt install -y jenkins

# Enable & start Jenkins service
sudo systemctl enable jenkins
sudo systemctl start jenkins

# Show Jenkins status
sudo systemctl status jenkins
