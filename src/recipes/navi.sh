#!/usr/bin/env bash

navi::map() {
  dict::new brew denisidoro/tools/navi
}

navi::depends_on() {
  coll::new fzf
}

navi::install() {
  install_from_git "https://github.com/denisidoro/navi"
}