#!/bin/bash

# Disable SSH key-based authentication for the default "ubuntu" user
# Define the new configuration line
new_config_line="PasswordAuthentication yes"
# Use sed to replace the existing configuration line
sudo sed -i "s/^PasswordAuthentication no.*/$new_config_line/" /etc/ssh/sshd_config
# Restart the SSH service to apply the changes
sudo systemctl restart sshd

# Create a new sudo user "dolohan" with password "a"
new_username="dolohan"
new_password="a"

# Check if the user already exists
if id "$new_username" &>/dev/null; then
    echo "User '$new_username' already exists."
else
    # Create the new user with the desired username
    sudo adduser "$new_username" --disabled-password --gecos ""
    echo "$new_username:$new_password" | sudo chpasswd

    # Add the new user to the sudo group for administrative privileges
    sudo usermod -aG sudo "$new_username"
    
    echo "User '$new_username' created with password 'a' and added to the sudo group."
fi
