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
  video/brightnessup)
    sudo -u ${user} xbacklight -display :0.0 +10
    ;;
  video/brightnessdown)
    sudo -u ${user} xbacklight -display :0.0 -10
    ;;
  *)
    usage
    ;;
esac
