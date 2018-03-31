#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Provide a username!"
  exit 1
fi

user="$1"
outfile="data/followings/$user.txt"

# Pull followings for a user and sleep if we get rate limited
followings() {
  output="$(t followings $user)"

  if [ "$?" -eq 0 ]; then
    echo "$output"
  else
    sleep 30
    followings
  fi
}

# Only pull followings if it isn't already cached
[ -f "$outfile" ] || followings > "$outfile"
