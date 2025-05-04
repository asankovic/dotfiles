#!/usr/bin/env bash

for script in ./*; do
  [ -x "$script" ] && [ "$script" != "$0" ] && "$script"
done
