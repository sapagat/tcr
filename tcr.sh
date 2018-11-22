#!/usr/bin/env bash

TEST_OUTPUT=/tmp/tcr_ouput.log

test () {
  rspec > $TEST_OUTPUT
}

commit () {
  cat $TEST_OUTPUT
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
