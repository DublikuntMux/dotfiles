#!/bin/sh

timestamp=$(date +"%Y%m%d%H%M%S")
recording_file="$videos_dir/screen_recording_$timestamp.webm"

wf-recorder -g "$(slurp)" -f "$recording_file" --audio -c vp9_vaapi -d /dev/dri/renderD128 -x yuv420p
