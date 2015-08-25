#!/bin/sh

if [ $# -eq 0 ]
then
  echo "usage: with <expression> ..." >&2
  exit 1
fi


# main routine

for expr in "$@"
do
  exprs=$exprs" -e \"$expr\""
done

for file in $(find .)
do
  if [ -z "$(echo "$file" | grep -e "/\." -e "$\.[^/]")" ] || [ -r "$file" ]
  then
    eval grep -nHI "$exprs" \""$file"\" &
  fi
done

wait
