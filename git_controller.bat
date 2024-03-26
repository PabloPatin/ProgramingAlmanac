@echo off
set REPO_URL="https://github.com/PabloPatin/ProgramingAlmanarc.git"
set BRANCH="main"
set COMMIT_MESSAGE="Library update"

rem Переход в директорию вашего проекта
cd "D:\ProgramingAlmanac"

rem Добавление всех изменений в индекс
git add .

rem Создание коммита с указанным сообщением
git commit -m %COMMIT_MESSAGE%

rem Отправка изменений на сервер
git push origin %BRANCH%

exit