@echo off

setlocal EnableDelayedExpansion
set "option="
for %%a in (%*) do (
   if not defined option (
      set arg=%%a
      if "!arg:~0,1!" equ "-" set "option=!arg!"
   ) else (
      set "option!option!=%%a"
      set "option="
   )
)

if defined option-t (
set ICON_TYPE=%option-t%
) else if defined option--type (
set ICON_TYPE=%option--type%
) else (
set ICON_TYPE=0
)

if %ICON_TYPE% == 0 (
    set ICON_TYPE=0
) else (
    if %ICON_TYPE% == default (
        set ICON_TYPE=0
    ) else if %ICON_TYPE% == good (
        set ICON_TYPE=1
    ) else if %ICON_TYPE% == bad (
        set ICON_TYPE=2
    ) else (
        echo %ICON_TYPE% is not valid argument
    )
)

cd /D ".."

attrib +s "ProgramingAlmanac"

CD "ProgramingAlmanac"

ATTRIB -S -H desktop.ini
echo. > desktop.ini

call :add_to_file [.ShellClassInfo]
call :add_to_file ConfirmFileOp=0
call :add_to_file NoSharing=1
call :add_to_file IconResource=D:\ProgramingAlmanac\.source\book-icon.icl,%ICON_TYPE%
call :add_to_file InfoTip=My own library of programing knowledge
call :add_to_file LocalizedDisplayName="Библиотека знаний"
call :add_to_file [ViewState]
call :add_to_file Mode=
call :add_to_file Vid=
call :add_to_file FolderType=Generic

ATTRIB +S +H desktop.ini

exit /b


:add_to_file
echo.%* >> desktop.ini
endlocal