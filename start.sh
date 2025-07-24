#!/bin/bash
echo "Запуск CRM системы..."
echo "Требуется пароль для sudo:"
sudo docker-compose up --build -d

if [ $? -eq 0 ]; then
    echo "✅ Контейнеры успешно запущены!"
    echo "📍 Frontend доступен по адресу: http://localhost:3000"
    echo "📍 Backend API доступен по адресу: http://localhost:3001"
    echo "📍 PostgreSQL доступен на порту: 5433"
    echo ""
    echo "Для просмотра логов используйте: sudo docker-compose logs -f"
    echo "Для остановки используйте: sudo docker-compose down"
else
    echo "❌ Ошибка при запуске контейнеров"
fi