#!/usr/bin/env bash

declare -r TRUE=0
declare -r FALSE=1

function does_exist()
{
  hash "$1" 2>/dev/null && return $TRUE || return $FALSE
}
