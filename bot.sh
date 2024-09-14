#!/bin/bash

# Step 1: Setup storage permission in Termux
termux-setup-storage

# Step 2: Upgrade package lists and update installed packages
pkg upgrade -y

# Step 3: Install Python
pkg install python -y

# Step 4: Install required Python packages
pip install requests \
    && pip install bs4 \
    && pip install setuptools \
    && pip install cython==0.29.37 \
    && pip install pyyaml==5.4.1 --no-build-isolation \
    && pip install colorama \
    && pip install orator \
    && pip install pycryptodome \
    && pip install pycryptodomex \
    && pip install mysql-connector

# Step 5: Navigate to the directory where the bot is located
cd /storage/emulated/0/Download/mobile

# Step 6: Check if main.pyc exists
if [ -f "main.pyc" ]; then
    echo "main.pyc file found! Starting the bot..."
    python main.pyc
else
    echo "main.pyc file not found. Trying the mobile/mobile directory..."

    # Try the nested mobile/mobile directory
    cd /storage/emulated/0/Download/mobile/mobile

    if [ -f "main.pyc" ]; then
        echo "main.pyc file found in the mobile/mobile directory! Starting the bot..."
        python main.pyc
    else
        echo "Error: The main.pyc file was not found in either directory. Please check the setup."
        exit 1
    fi
fi