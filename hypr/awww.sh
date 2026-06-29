#!/bin/sh
WALLDIR="$HOME/.config/hypr/img/"

# Ждём инициализации
sleep 2

while true; do
  # 1. Если hyprlock запущен, просто ждем 5 секунд и проверяем снова
  if pgrep -x "hyprlock" > /dev/null; then
    sleep 5
    continue
  fi

  # 2. Выбор случайной картинки
  WALL=$(find "$WALLDIR" -type f \( -iname "*.gif" -o -iname "*.png" -o -iname "*.jpg" -o -iname "*.jpeg" \) | shuf -n1)

  # 3. Еще раз проверяем замок ПРЯМО перед запуском анимации
  if ! pgrep -x "hyprlock" > /dev/null; then
    awww img "$WALL" \
      --transition-type fade \
      --transition-duration 4 \
      --transition-fps 30
  fi

  # Интервал смены обоев (1 минута)
  sleep 60
done
