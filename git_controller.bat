@echo off

set LOG_FILE="D:\ProgramingAlmanac\log.txt"

echo. > %LOG_FILE%

:main
set REPO_URL="https://github.com/PabloPatin/ProgramingAlmanarc.git"
set BRANCH="main"
set COMMIT_MESSAGE="Library update"

echo [%DATE% %TIME%] - Запуск программы >> %LOG_FILE%

call :log Конфигурация пользователя git
git config user.email "pashka.lop@mail.ru" >> %LOG_FILE% 2>&1
git config user.name "PabloPatin" >> %LOG_FILE% 2>&1

call :log Переход в директорию вашего проекта
cd /D "D:\ProgramingAlmanac"

call :log Добавление всех изменений в индекс
git add . >> %LOG_FILE% 2>&1

call :log Создание коммита с указанным сообщением
git commit -m %COMMIT_MESSAGE% >> %LOG_FILE% 2>&1

call :log Отправка изменений на сервер
git push origin %BRANCH% >> %LOG_FILE% 2>&1
exit

:log
for %%A in (.) do echo %%~fA^> %* >> %LOG_FILE%
endlocal