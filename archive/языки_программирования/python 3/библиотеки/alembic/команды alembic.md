# Установка
`pip install alembic`
# Инициализация
1) `alembic init directory`
2) Зайти в alembic.ini и указать `sqlalchemy.url` - подключение к бд
3) В env.py указать `target_metadata = Base.metadata`
# Создание миграции
`alembic revision [--autogenerate] -m "message"`
Флаг `--autogenerate` позволяет создать миграцию автоматически на основе declarative_base
# Применение и откат миграции
## Применить
`alembic -c directory/alembic.ini upgrade revision`
В качестве `revision` можно указать head, кол-во ревизий или идентификатор ревизии 
## Откатить
`alembic -c directory/alembic.ini downgrade revision`
В качестве `revision` можно указать base, -кол-во ревизий или идентификатор ревизии 
# Оффлайн режим
Вывести код миграции в SQL не внося изменений в базу данных
`alembic upgrade revision --sql`