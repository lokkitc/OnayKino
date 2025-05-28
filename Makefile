.PHONY: run stop restart clean setup copy-requirements

# Загрузка переменных окружения
include .env
export

# Копирование requirements.txt во все сервисы
copy-requirements:
	copy services\auth_service\requirements.txt services\user_service\requirements.txt
	copy services\auth_service\requirements.txt services\movie_service\requirements.txt
	copy services\auth_service\requirements.txt services\catalog_service\requirements.txt
	copy services\auth_service\requirements.txt services\episode_service\requirements.txt
	copy services\auth_service\requirements.txt services\media_service\requirements.txt
	copy services\auth_service\requirements.txt services\recommendation_service\requirements.txt

# Настройка виртуальных окружений
setup: copy-requirements
	python -m venv services/auth_service/venv
	python -m venv services/user_service/venv
	python -m venv services/movie_service/venv
	python -m venv services/catalog_service/venv
	python -m venv services/episode_service/venv
	python -m venv services/media_service/venv
	python -m venv services/recommendation_service/venv
	services/auth_service/venv/Scripts/pip install -r services/auth_service/requirements.txt
	services/user_service/venv/Scripts/pip install -r services/user_service/requirements.txt
	services/movie_service/venv/Scripts/pip install -r services/movie_service/requirements.txt
	services/catalog_service/venv/Scripts/pip install -r services/catalog_service/requirements.txt
	services/episode_service/venv/Scripts/pip install -r services/episode_service/requirements.txt
	services/media_service/venv/Scripts/pip install -r services/media_service/requirements.txt
	services/recommendation_service/venv/Scripts/pip install -r services/recommendation_service/requirements.txt

# Запуск всех сервисов
run:
	services/auth_service/venv/Scripts/python services/auth_service/main.py & \
	services/user_service/venv/Scripts/python services/user_service/main.py & \
	services/movie_service/venv/Scripts/python services/movie_service/main.py & \
	services/catalog_service/venv/Scripts/python services/catalog_service/main.py & \
	services/episode_service/venv/Scripts/python services/episode_service/main.py & \
	services/media_service/venv/Scripts/python services/media_service/main.py & \
	services/recommendation_service/venv/Scripts/python services/recommendation_service/main.py

# Остановка всех сервисов
stop:
	pkill -f "python services/.*/main.py"

# Перезапуск всех сервисов
restart: stop run

# Запуск отдельных сервисов
run-auth:
	services/auth_service/venv/Scripts/python services/auth_service/main.py &

run-user:
	services/user_service/venv/Scripts/python services/user_service/main.py &

run-movie:
	services/movie_service/venv/Scripts/python services/movie_service/main.py &

run-catalog:
	services/catalog_service/venv/Scripts/python services/catalog_service/main.py &

run-episode:
	services/episode_service/venv/Scripts/python services/episode_service/main.py &

run-media:
	services/media_service/venv/Scripts/python services/media_service/main.py &

run-recommendation:
	services/recommendation_service/venv/Scripts/python services/recommendation_service/main.py &