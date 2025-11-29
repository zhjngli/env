#!/bin/sh
# https://github.com/dandavison/delta
# Check if delta is installed
if which delta >/dev/null 2>&1; then
    echo "git-delta is already installed."
else
    brew install git-delta
    # curl -s https://api.github.com/repos/dandavison/delta/releases/latest \
    # | grep "browser_download_url.*amd64.deb" \
    # | grep -v "musl" \
    # | cut -d : -f 2,3 \
    # | tr -d \" \
    # | wget -qi - \
    # | dpkg -i -
fi
