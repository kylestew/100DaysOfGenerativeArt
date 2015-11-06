#!/bin/sh

ffmpeg -f image2 -i output/frames%16d.tif -r 10 -vcodec libx264 -pix_fmt yuv420p output.mp4

open output.mp4

rm output/*
