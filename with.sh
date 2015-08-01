#!/bin/sh

if [ $# -eq 0 ]
then
  echo "usage: with <expression> ..." >&2
  exit 1
fi

for expr in "$@"
do
  exprs=$exprs" -e \"$expr\""
done

for file in $(find . -type f)
do
  if [ -z "$(echo "$file" | grep -e "/\." -e "$\.[^/]")" ]
  then
    files=$files" \"$file\""
  fi
done

test -r "$file" && eval grep -nHIT $exprs $files
