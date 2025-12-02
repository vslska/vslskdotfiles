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
  swww img "$WALL" \
    --transition-type random \
    --transition-duration 2 \
    --transition-fps 60

  sleep 30
done

#WALL=$(find "$WALLDIR" -type f \( -iname "*.gif" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | shuf -n1)

# Если ничего не найдено — пропускаем итерацию
#if [ -z "$WALL" ] || [ ! -f "$WALL" ]; then
#  echo "Нет изображений в $WALLDIR — пропускаем"
#  sleep 30
#  continue
#fi
