#!/bin/bash

# Install pip
apt-get clean
apt-get update && apt-get install -y \
    python-pip \
    && rm -rf /var/lib/apt/lists/* \
    && pip install --upgrade pip \
    && rm -rf .cache/pip

# Install Elpy dependencies
pip install \
    autopep8 \
    flake8 \
    importmagic \
    rope \
    yapf
