#!/bin/bash

arg1=$1
arg2=$2
arg3=$3

message="Hello $arg1,\n\nI hope you're doing well. I came across the $arg2 role at $arg3 and it immediately caught my attention. It seems like a perfect fit for my skills and interests. I'm genuinely excited to learn more about it. Could you please provide me with additional details about the role? I would greatly appreciate it.\n\nBest regards,\nAyush"


echo -e "$message" | xclip -sel clip
