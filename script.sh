#!/usr/bin/env bash
set -e

case "$1" in
  build)
    cmake -S . -B build -G Ninja
    cmake --build build
    ;;
  run)
    ./build/helloWindow
    ;;
  clean)
    rm -rf build
    ;;
  rebuild)
    rm -rf build
    cmake -S . -B build -G Ninja
    cmake --build build
    ;;
  *)
    echo "Usage: ./dev.sh [build|run|clean|rebuild]"
    ;;
esac
