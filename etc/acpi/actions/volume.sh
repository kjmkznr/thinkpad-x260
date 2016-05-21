#!/bin/sh
#
# /etc/acpi/actions/volume.sh (must be executable)
#

PATH=/usr/bin

die() {
  echo $*
  exit 1
}
usage() {
  die "usage: $(basename $0) up|down|mute"
}

test -n "$1" || usage

ACTION=$1
shift

user=$(/usr/local/bin/get_seat_uer_name.sh Seat1)

case $ACTION in
  button/volumeup)
    sudo -u ${user} pactl set-sink-volume 0 +5%
    ;;
  button/volumedown)
    sudo -u ${user} pactl set-sink-volume 0 -5%
    ;;
  mute)
    sudo -u ${user} pactl set-sink-mute 0 toggle
    ;;
  *)
    usage
    ;;
esac
