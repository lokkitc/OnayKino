# OnayKino - Платформа для просмотра сериалов

## Архитектура микросервисов

### Основные сервисы:
**Общие черты Сервисов
-  

1. **Auth Service** (`/services/auth`)
   - FastAPI + PostgreSQL + SQLAlchemy + Alembic + bcrypt
   - JWT аутентификация
   - Управление пользователями

2. **Catalog Service** (`/services/catalog`)
   - FastAPI + PostgreSQL + SQLAlchemy + Alembic
   - Управление каталогом сериалов
   - Поиск и фильтрация

3. **Media Service** (`/services/media`)
   - FastAPI + MinIO
   - Стриминг видео
   - Управление медиафайлами

4. **User Service** (`/services/user`)
   - FastAPI + PostgreSQL + SQLAlchemy + Alembic + bcrypt
   - Профили пользователей
   - История просмотров

5. **Recommendation Service** (`/services/recommendation`)
   - FastAPI + Redis
   - Система рекомендаций
   - Аналитика

6. **Movie Service** (`/services/movie`)
   - FastAPI + PostgreSQL + SQLAlchemy + Alembic
   - Управление фильмами
   - Метаданные фильмов
   - Рейтинги и отзывы
   - Интеграция с Media Service для видео

7. **Series Service** (`/services/episode`)
   - FastAPI + PostgreSQL + SQLAlchemy + Alembic
   - Управление сериалами
   - Управление сезонами
   - Управление эпизодами
   - Прогресс просмотра
   - Интеграция с Media Service для видео

8. **API Gateway** (`/gateway`)
   - FastAPI + Nginx
   - Маршрутизация
   - Балансировка нагрузки

### Технологический стек:

- **Backend**: FastAPI, Python 3.9+
- **Базы данных**: PostgreSQL, Redis, MinIO
- **Очереди сообщений**: RabbitMQ
- **Контейнеризация**: Docker, Docker Compose
- **Оркестрация**: Kubernetes (опционально)
- **Мониторинг**: Prometheus + Grafana
- **Валидация**: Pydantic
- **Шифрование**: bcrypt

### Структура проекта:

```
onaykino/
├── services/
│   ├── auth/
│   ├── catalog/
│   ├── media/
│   ├── user/
│   ├── recommendation/
│   ├── movie/
│   └── series/
├── gateway/
├── docker/
├── k8s/
└── docs/
```

## Установка и запуск

1. Установите зависимости:
```bash
pip install -r requirements.txt
```

2. Запустите сервисы через Docker Compose:
```bash
docker-compose up -d
```

## Разработка

Каждый сервис имеет свою собственную базу данных и может быть разработан независимо. 
Для локальной разработки используйте Docker Compose для запуска всех зависимостей.