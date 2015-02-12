#!/bin/bash

if [ ! -z $1 ] 
then 
    VIDEO=$1
else
    echo "You didn't provide source video."
    exit;
fi

#WebM
ffmpeg -i $1.mp4 -pass 1 -codec:v libvpx -b:v 3072k -codec:a libvorbis -b:a 192k -s 1920x1080 -f webm -y /dev/null
ffmpeg -i $1.mp4 -pass 2 -codec:v libvpx -b:v 3072k -codec:a libvorbis -b:a 192k -s 1920x1080 -y $1_1920x1080.webm

ffmpeg -i $1.mp4 -pass 1 -codec:v libvpx -b:v 2048k -codec:a libvorbis -b:a 192k -s 1280x720 -f webm -y /dev/null
ffmpeg -i $1.mp4 -pass 2 -codec:v libvpx -b:v 2048k -codec:a libvorbis -b:a 192k -s 1280x720 -y $1_1280x720.webm

ffmpeg -i $1.mp4 -pass 1 -codec:v libvpx -b:v 512k -codec:a libvorbis -b:a 128k -s 640x360 -f webm -y /dev/null
ffmpeg -i $1.mp4 -pass 2 -codec:v libvpx -b:v 512k -codec:a libvorbis -b:a 128k -s 640x360 -y $1_640x360.webm

#mp4
ffmpeg -i $1.mp4 -pass 1 -codec:v libx264 -b:v 3072k -codec:a libfaac -b:a 192k -movflags +faststart -pix_fmt yuv420p -s 1920x1080 -f webm -y /dev/null
ffmpeg -i $1.mp4 -pass 2 -codec:v libx264 -b:v 3072k -codec:a libfaac -b:a 192k -movflags +faststart -pix_fmt yuv420p -s 1920x1080 -y $1_1920x1080.mp4

ffmpeg -i $1.mp4 -pass 1 -codec:v libx264 -b:v 2048k -codec:a libfaac -b:a 192k -movflags +faststart -pix_fmt yuv420p -s 1280x720 -f mp4 -y /dev/null
ffmpeg -i $1.mp4 -pass 2 -codec:v libx264 -b:v 2048k -codec:a libfaac -b:a 192k -movflags +faststart -pix_fmt yuv420p -s 1280x720 -y $1_1280x720.mp4

ffmpeg -i $1.mp4 -pass 1 -codec:v libx264 -b:v 512k -codec:a libfaac -b:a 128k -movflags +faststart -pix_fmt yuv420p -s 640x360 -f mp4 -y /dev/null
ffmpeg -i $1.mp4 -pass 2 -codec:v libx264 -b:v 512k -codec:a libfaac -b:a 128k -movflags +faststart -pix_fmt yuv420p -s 640x360 -y $1_640x360.mp4