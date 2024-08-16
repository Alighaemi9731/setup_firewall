#!/bin/bash

# Check if script is run as root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# Update package list
apt update

# Install UFW if not already installed
apt install ufw -y

# Reset UFW to default settings
ufw --force reset

# Set default policies
ufw default deny incoming
ufw default allow outgoing

# Allow necessary ports
ufw allow 22/tcp
ufw allow 80/tcp
ufw allow 443/tcp

# Enable UFW
ufw --force enable

# Display status
ufw status verbose

echo "Firewall setup complete. Only ports 22, 80, and 443 are open."
