#!/bin/sh
WALLDIR="$HOME/.config/hypr/img/"
BACKGROUND_LINK="$HOME/.config/background"

# Ждём, пока swww init завершится
sleep 2

while true; do
  # Выбираем случайную картинку
  WALL=$(find "$WALLDIR" -type f \( -iname "*.gif" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | shuf -n1)

  # Обновляем символическую ссылку для HyprPanel / AGS
  ln -sf "$WALL" "$BACKGROUND_LINK"

  # Меняем обои с анимацией
  awww img "$WALL" \
    --transition-type fade \
    --transition-duration 4 \
    --transition-fps 30

  sleep 30
done
