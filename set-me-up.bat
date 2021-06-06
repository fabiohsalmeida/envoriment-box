cls

set @dir=%~dp0

setx path "%PATH%;%@dir%\c;%@dir%\python;%@dir%\kali"

echo %PATH%