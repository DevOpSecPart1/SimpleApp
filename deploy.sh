#!/usr/bin/env bash

# Update system and install required packages
sudo apt update && sudo apt install -y nodejs npm

# Install pm2 globally if not installed
sudo npm install -g pm2

# Stop any running instance of the application (ignore errors if it doesn't exist)
pm2 stop simple_app || true  

# Navigate to the application directory
cd ~/SimpleApp || exit 1

# Install application dependencies
npm install

# Ensure correct file permissions for SSL keys
chmod 600 privatekey.pem server.crt server.key || true

# Start the application with PM2 on port 8443
PORT=8443 pm2 start ./bin/www --name simple_app

# Save PM2 process list and set it to start on reboot
pm2 save
pm2 startup systemd -u ubuntu --hp /home/ubuntu

# Restart PM2 to apply changes
pm2 restart simple_app

echo "Deployment complete! App running on port 8443."
