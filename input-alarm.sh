#!/bin/bash


ALARM_DIR=~/.alarms
mkdir -p "$ALARM_DIR"
PID_FILE="$ALARM_DIR/alarm_pids"


SCRIPT_DIR=$(dirname "$(readlink -f "$0")")
SOUND_DIR="$SCRIPT_DIR/sounds"


install_if_missing() {
  PACKAGE=$1
  if ! command -v "$PACKAGE" &>/dev/null; then
    echo "$PACKAGE is not installed. Would you like to install it? (y/n)"
    read -r RESPONSE
    if [[ $RESPONSE =~ ^[Yy]$ ]]; then
      sudo apt update && sudo apt install -y "$PACKAGE"
    else
      echo "The script cannot continue without $PACKAGE. Exiting."
      exit 1
    fi
  fi
}


clear_alarms() {
  if [ -f "$PID_FILE" ]; then
    while IFS= read -r PID; do
      if ps -p "$PID" &>/dev/null; then
        kill "$PID" && echo "Cleared alarm with PID $PID."
      fi
    done <"$PID_FILE"
    rm -f "$PID_FILE"
    echo "All alarms cleared."
  else
    echo "No active alarms to clear."
  fi
}


install_if_missing zenity
install_if_missing mpg123


if [ "$1" == "clear" ]; then
  clear_alarms
  exit 0
elif [ -z "$1" ]; then
  echo "Usage: input-alarm.sh <time> [message]"
  echo "       input-alarm.sh clear (to clear all active alarms)"
  exit 1
fi


TARGET_TIME=$(date -d "$1" +%s 2>/dev/null)
if [ $? -ne 0 ]; then
  echo "Invalid time format. Use a format like 10:45am."
  exit 1
fi

CURRENT_TIME=$(date +%s)
WAIT_TIME=$((TARGET_TIME - CURRENT_TIME))


if [ $WAIT_TIME -le 0 ]; then
  echo "The specified time is in the past. Please specify a future time."
  exit 1
fi


if [ -z "$2" ]; then
  MESSAGE="Alarm - it's $1!"
else
  MESSAGE="Alarm - $2!"
fi


echo "Alarm set for $1 (in $WAIT_TIME seconds)."


(
  sleep $WAIT_TIME


  if [ ! -d "$SOUND_DIR" ]; then
    zenity --error --text="Sounds directory not found at $SOUND_DIR. Please add a sounds directory."
    exit 1
  fi
  RANDOM_SOUND=$(find "$SOUND_DIR" -type f -name "*.mp3" | shuf -n 1)

  if [ -z "$RANDOM_SOUND" ]; then
    zenity --error --text="No MP3 files found in $SOUND_DIR. Please add some sounds."
    exit 1
  fi

  export DISPLAY=${DISPLAY:-:0}
  
 
  (mpg123 "$RANDOM_SOUND" &>/dev/null &)
  zenity --info --text="$MESSAGE" --title="Alarm"
) &


echo $! >>"$PID_FILE"


exit 0
