#!/bin/sh

ffmpeg -framerate 30 -f image2 -i out/frame%8d.png -framerate 40 -vcodec libx264 -pix_fmt yuv420p output.mp4
#ffmpeg -f image2 -i output/frames%16d.tif -preset medium -crf 24 -c:a libfaac -q:a 100 output.mp4

open output.mp4

#rm output/*
