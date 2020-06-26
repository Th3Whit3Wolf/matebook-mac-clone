#!/usr/bin/env bash

morning="07:00"
night="19:00"

# Get current time
currenttime=$(date +%H:%M)


# Check if time is between night and morning time
if [[ ! "$currenttime" < "$night" ]] || [[ "$currenttime" < "$morning" ]]; then
  konsole --profile Dark
  # Change default konsole profile
  sed -i 's/DefaultProfile=Light.profile/DefaultProfile=Dark.profile/' /home/doc/.config/konsolerc
else
  konsole --profile Light
  # Change default konsole profile
  sed -i 's/DefaultProfile=Dark.profile/DefaultProfile=Light.profile/' /home/doc/.config/konsolerc
fi
