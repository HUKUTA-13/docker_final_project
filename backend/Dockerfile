# Стадия 1: устанавливаем зависимости
FROM node:18-alpine AS builder
WORKDIR /app
# Копируем и устанавливаем зависимости
COPY package*.json ./
RUN npm ci

# Стадия 2: Финальная сборка и запуск 
FROM node:18-alpine AS final
WORKDIR /app

# Создание непривилигированного пользователя 
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Копируем минимальный набор файлов из первого этапа,
# переключаем владельца на appuser
COPY --from=builder --chown=appuser:appgroup /app/node_modules ./node_modules
# Копируем код приложения, переключаем владельца на appuser
COPY --chown=appuser:appgroup package*.json server.js ./

# Переключение на непривилигированного пользователя
USER appuser
# Запуск приложения
EXPOSE 3001
ENTRYPOINT ["npm", "start"]

