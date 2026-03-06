# Этап 1: Установка зависимостей
FROM node:18-alpine AS deps
WORKDIR /app
COPY package*.json ./
# Установка зависимостей без мусора
RUN npm ci

# Этап 2: Сборка на основе зависимостей
FROM node:18-alpine AS builder
WORKDIR /app
# Копируем установленные зависимости из 1 этапа
COPY --from=deps /app/node_modules ./node_modules
# Копируем остальные файлы
COPY . .
# Сборка
RUN npm run build

# Этап 3: Финальный образ
FROM nginx:1.21-alpine AS production
# Копируем статические файлы из 2 этапа
COPY --from=builder /app/build /usr/share/nginx/html

EXPOSE 80
# Запуск nginx
CMD ["nginx", "-g", "daemon off;"]
