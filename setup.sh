#!/bin/bash

sudo apt-get update
sudo apt-get --assume-yes install git

git clone https://github.com/sahil-sagwekar2652/videodubber-q2.git
cd videodubber-q2

python -m venv venv
source venv/bin/activate
pip install -r requirements.txt

gunicorn --bind 0.0.0.0:5000 --access-logfile /path/to/access.log --error-logfile /path/to/error.log wsgi:app

