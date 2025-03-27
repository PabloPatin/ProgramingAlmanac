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
SET option

if defined option-x (
   echo Option -x given: "%option-x%"
) else (
   echo Option -x not given
)