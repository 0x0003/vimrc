#!/usr/bin/env bash

configdir="$HOME/.vim/.backup"

if [ ! -d "$configdir" ]; then
  mkdir -p $configdir/sessions
  mkdir -p $configdir/undofiles
else
  echo "$configdir exists; aborting"
  exit 1
fi

