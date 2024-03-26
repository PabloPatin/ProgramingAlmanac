@echo off

for %%A in (.) do set "CURRENT_DIR=%%~fA"
set LOG_FILE="D:\ProgramingAlmanac\log.txt"

echo. > %LOG_FILE%

:main
set REPO_URL="https://github.com/PabloPatin/ProgramingAlmanarc.git"
set BRANCH="main"
set COMMIT_MESSAGE="Library update"

echo [%DATE% %TIME%] - Запуск программы >> %LOG_FILE%

call :log Переход в директорию вашего проекта
cd /D "D:\ProgramingAlmanac"
for %%A in (.) do set "CURRENT_DIR=%%~fA"

call :log Добавление всех изменений в индекс
git add . >> %LOG_FILE% 2>&1

call :log Создание коммита с указанным сообщением
git commit -m %COMMIT_MESSAGE% >> %LOG_FILE% 2>&1

call :log Отправка изменений на сервер
git push origin %BRANCH% >> %LOG_FILE% 2>&1
exit

:log
echo %CURRENT_DIR%^> %* >> %LOG_FILE%
endlocal