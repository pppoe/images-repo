#! /bin/bash

palette="/tmp/palette.png"
#filters="fps=16,scale=768:-1:flags=lanczos"
filters="fps=16,scale=960:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
