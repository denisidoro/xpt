#!/usr/bin/env bash

echoerr() {
   echo "$@" 1>&2
}

tap() {
   local -r input="$(cat)"
   echoerr "$input"
   echo "$input"
}

die() {
   echoerr "$@"
   exit 42
}