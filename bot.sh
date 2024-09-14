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

# Step 6: Run the bot
python main.pyc