#!/bin/bash

read -rp "GitHub username: " user_name
read -rp "GitHub email: " email

echo "⚙️ Setting new git config..."
git config --global user.name "$user_name"
git config --global user.email "$email"

if [ -f ~/.ssh/id_ed25519 ]; then
    echo "Existing SSH key found at ~/.ssh/id_ed25519"
    echo "Do you want to overwrite it? (y/n)"
    read -r choice
    if [[ $choice != "y" ]]; then
        echo "Operation cancelled."
        exit 0
    fi
fi

echo "🗝️ Generating new SSH key..."
ssh-keygen -t ed25519 -C "$email" -f ~/.ssh/id_ed25519 -N ""

echo "✅ SSH key generated successfully."
echo "-------------------------------------------------"
echo "📋 Copy the following public key and add it to GitHub:"
cat ~/.ssh/id_ed25519.pub
echo
echo "-------------------------------------------------"
echo "👉 Go to: https://github.com/settings/keys -> 'New SSH key'"
echo "Paste the copied key there."
echo
echo "Then run this to test your connection:"
echo "ssh -T git@github.com"