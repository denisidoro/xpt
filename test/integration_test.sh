#!/usr/bin/env bash

XPT_BIN="${XPT_HOME}/xpt"
TEST_DIR="${XPT_HOME}/test"

_xpt() {
   "$XPT_BIN" "$@"
}

assert_version() {
   local -r version="$(cat "$XPT_BIN" | grep VERSION | cut -d'=' -f2 | tr -d '"')"

   _xpt --version \
      | test::equals "$version"
}

assert_help() {
   _xpt --help \
      | grep -q 'Options:'
}

assert_home() {
   _xpt home \
      | grep -q '/'
}

test::set_suite "integration"
test::run "version" assert_version
test::run "help" assert_help
test::run "home" assert_home
