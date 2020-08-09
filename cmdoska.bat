@echo off
cls

echo Booting into Cmdoska 9...
set lang=pt_br
cls
type boot_logo.txt

::set where=%cd%

echo Boot complete!
echo.

:login
if exist home\default goto sh
set/p user="Usuario> "
if not exist home\%user% (echo Usuario incorreto, tente novamente!&&goto login)

set/p passwd="Senha> "
cls


:sh
dir > nul
:goto sh