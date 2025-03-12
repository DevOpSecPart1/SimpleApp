#!/usr/bin/env bash

# Update system and install required packages
sudo apt update && sudo apt install -y nodejs npm

# Install pm2 if not installed
sudo npm install -g pm2

# Stop any running instance of the application
pm2 stop simple_app || true  # Avoid errors if process doesn't exist

# Change directory to where the application is downloaded
cd SimpleApp

# Install application dependencies
npm install

# Start the application with PM2 on port 8443
pm2 start ./bin/www --name simple_app -- --port 8443

# Save PM2 process list
pm2 save
