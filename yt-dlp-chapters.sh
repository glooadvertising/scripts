#! /bin/bash

cd ~/Movies

NEWDIR=ytdlp_dwnlds

if [[ ! -e $NEWDIR ]]; then
    mkdir $NEWDIR
fi

cd $NEWDIR

echo "Hello! Please provide the URL of the YouTube video you want us to download."
read -p "YouTube video URL: " YT_URL

yt-dlp -f bestvideo+bestaudio/best --merge-output-format mkv $YT_URL --split-chapters