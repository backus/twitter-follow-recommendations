#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Pass in your username and the number recommendations you want!"
  exit 1
fi

if [ ! -f favorites.txt ]; then
  echo "Create a list of your favorite people on twitter in favorites.txt. One username per line."
  exit 1
fi

me="$1"
limit="$2"

mkdir -p data/followings

# Download who we follow
./followings.sh "$me"

# Download who everyone else follows
cat favorites.txt \
  | xargs -L1 -I% sh -c '>&2 echo "Loading @%" && ./followings.sh %'

>&2 echo
>&2 echo "Top $limit recommendations:"
>&2 echo

# Take the list of all followed people, count the occurences, grab top N
ruby favorites.rb "$me"           \
  | uniq --count                  \
  | sort --reverse --numeric-sort \
  | head --lines "$limit"
