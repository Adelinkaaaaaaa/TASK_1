#!/usr/bin/env bash
#
# Q3. Бухгалтер Вася «случайно» сохранил пароли прямо в папку проекта.
#
# Запуск (из папки репозитория):
#     bash create_passwords.sh

set -u

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

printf '%s' "# Пароли ООО «Рога и Копыта». НИКОМУ НЕ ПОКАЗЫВАТЬ!!!
# Вася, бухгалтерия

Почта директора:  director / Ponchik2024!
Wi-Fi в офисе:    RogaKopyta_Guest / 12345678
Бухгалтерия:      buh / qwerty
Сервер:           admin / admin
Банк-клиент:      roga_kopyta / ne_ugadaesh_123
" > "$REPO_DIR/passwords.txt"

echo "Ой! Вася сохранил файл passwords.txt прямо в папку проекта."
echo "Возвращайся к README.md — шаг 2."
