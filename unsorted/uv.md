---
tags:
  - python
  - пакетный_менеджер
---
`uv init` - создать проект
`uv init project` - создать подпапку с проектом
`uv venv` - создать виртуальное окружение
`uv add` - добавить зависимость из репозитория PyPl
`uv run` - запустить с использованием виртуального окружения
`uv python install <version>` - установить python определённой версии
`uv lock [--upgrade / --upgrade-package <pkg>]` - заморозить зависимости в файле *uv.lock*
`uv sync` - применить *uv.lock* к окружению проекта
