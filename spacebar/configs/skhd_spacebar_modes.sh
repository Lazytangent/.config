#!/usr/bin/env sh

if which spacebar >/dev/null; then
  case "$1" in
    default)
      spacebar -m config background_color       0xff7aa2f7
      spacebar -m config center_shell           off
      spacebar -m config title                  on
      ;;
    resize)
      spacebar -m config background_color       0xff0ece6a
      spacebar -m config title                  off
      spacebar -m config center_shell           on
      spacebar -m config center_shell_command   'echo "[RESIZE MODE]"'
      ;;
    m2)
      spacebar -m config background_color       0xffe0af68
      spacebar -m config center_shell           off
      spacebar -m config title                  on
      ;;
  esac
fi
