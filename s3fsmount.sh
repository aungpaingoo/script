#!/bin/bash

# Prompt for DigitalOcean Spaces credentials
read -p "Enter your DigitalOcean Spaces Access Key: " DO_SPACES_ACCESS_KEY
read -p "Enter your DigitalOcean Spaces Secret Key: " -s DO_SPACES_SECRET_KEY
echo  # Move to a new line

# Prompt for the DigitalOcean Space name
read -p "Enter your DigitalOcean Space Name (e.g., my-space): " DO_SPACE_NAME

# Prompt for the DigitalOcean Space region URL
read -p "Enter the DigitalOcean Space Region URL (e.g., https://nyc3.digitaloceanspaces.com/): " DO_SPACE_REGION_URL

# Prompt for the mount point
read -p "Enter the Mount Point (e.g., /mnt/my-space): " MOUNT_POINT

# Update and install S3FS
sudo apt update
sudo apt install -y s3fs

# Configure DigitalOcean Spaces credentials
echo "$DO_SPACES_ACCESS_KEY:$DO_SPACES_SECRET_KEY" > ~/.passwd-s3fs
chmod 600 ~/.passwd-s3fs

# Create the mount point directory
sudo mkdir -p $MOUNT_POINT

# Mount the DigitalOcean Space
sudo s3fs $DO_SPACE_NAME $MOUNT_POINT -o passwd_file=~/.passwd-s3fs -o url=$DO_SPACE_REGION_URL -o use_path_request_style

# Check if the DigitalOcean Space mount was successful
if [ $? -eq 0 ]; then
    echo "DigitalOcean Space mounted successfully at $MOUNT_POINT"
else
    echo "Failed to mount the DigitalOcean Space. Check your configuration."
fi