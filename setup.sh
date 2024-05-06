#!/bin/bash

sudo apt update -y
sudo apt-get --assume-yes install python3-pip

git clone https://github.com/sahil-sagwekar2652/videodubber-q2.git
cd videodubber-q2

sudo cp flask_app.service /etc/systemd/system

# source venv/bin/activate
pip3 install -r requirements.txt

echo "PATH+=:/home/ubuntu/.local/bin" >> ~/.bashrc
PATH+=:/home/ubuntu/.local/bin

sudo systemctl daemon-reload  # Reload systemd to read the new service file
sudo systemctl enable flask_app  # Enable the service to start on boot
sudo systemctl start flask_app   # Start the service
