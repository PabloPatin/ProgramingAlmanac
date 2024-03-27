@echo off

set GIT_EXE="C:\Program Files\Git\bin\git.exe"
set LOG_FILE="D:\ProgramingAlmanac\log.txt"

echo. > %LOG_FILE%

:main
set GIT_SSH_COMMAND="ssh -i C:\Users\pashk\.ssh\id_ed25519"
set REPO_URL="git@github.com:PabloPatin/ProgramingAlmanac.git"
set BRANCH="main"
set COMMIT_MESSAGE="Library update"

echo [%DATE% %TIME%] - Запуск программы >> %LOG_FILE%

call :log Конфигурация пользователя git
%GIT_EXE% config user.email "pashka.lop@mail.ru" >> %LOG_FILE% 2>&1
%GIT_EXE% config user.name "PabloPatin" >> %LOG_FILE% 2>&1

call :log Переход в директорию вашего проекта
cd /D "D:\ProgramingAlmanac"

call :log Добавление всех изменений в индекс
%GIT_EXE% add . >> %LOG_FILE% 2>&1

call :log Создание коммита с указанным сообщением
%GIT_EXE% commit -m %COMMIT_MESSAGE% >> %LOG_FILE% 2>&1

call :log Отправка изменений на сервер
%GIT_SSH_COMMAND% %GIT_EXE% push origin %BRANCH% >> %LOG_FILE% 2>&1
exit

:log
for %%A in (.) do echo %%~fA^> %* >> %LOG_FILE%
endlocal