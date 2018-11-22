#!/usr/bin/env bash

test () {
  rspec > /tmp/tcr_ouput.log
}

commit () {
  cat /tmp/tcr_ouput.log
  echo "Green!!!"
  git add -A
  git commit -m "$(date +%s)"
}

revert () {
  echo "Revert =("
  git reset --hard
  git clean -fd
}

test && commit || revert
