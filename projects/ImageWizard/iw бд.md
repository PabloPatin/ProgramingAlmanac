# Таблицы
## authors
Содержит каноничных авторов
id, имя, отображаемое имя, описание
## author_identities
Авторы, представленные на платформе
id, author_id, платформа, id на платформе, имя на платформе, url профиля, подписчики, рейтинг
## author_links
Внешние ссылки автора
тип ссылки, адрес ссылки
## artworks
Работы автора
id, каноничное название, описание, дата создания
## artwork_authors
Авторы работы (один или несколько)
## artwork_sources
Источник работы на платформе
artwork_id, id на платформе, имя платформы, ...
## artwork_source_payloads
Пэйлоад работы с платформы (нужен временно)
## media
медиаобъект
id, тип, хэш
## artwork_media
состав artwork
artwork_id, media_id, порядковый номер media, is_primary (для превью)
# Сценарии работы с бд
## Загрузка работы автора
1) Создать artwork
2) Если на платформе указан автор, то взять из author_identities
3) Создать artwork_source и artwork_source_payload
4) Если есть теги, добавить в artwork_tags (опционально)
5) Создать запись в media и в таблице соответствующего типа
6) Cохранить информацию о media в media_source_files и media_source_file_urls
7) Сохранить оригинал в одно из хранилищ storage и сделать записи в media_storage_objects и media_storage_locations
8) Добавить в artwork_media запись о media (опционально)