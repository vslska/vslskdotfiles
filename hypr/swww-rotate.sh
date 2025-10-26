#!/bin/sh
WALLDIR="$HOME/my/wallpaper/wall/"

# Ждём, пока swww init завершится (на всякий случай)
sleep 2

while true; do
  # Выбираем случайную картинку
  WALL=$(find "$WALLDIR" -type f \( -iname "*.gif" -o -iname "*.png" -o -iname "*.jpg" \) | shuf -n1)
  
  # Меняем обои с анимацией
  swww img "$WALL" \
    --transition-type random \
    --transition-duration 2 \
    --transition-fps 60
  
  # Ждём 30 сек
  sleep 30
done
