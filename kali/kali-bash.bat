REM Turn off echo so nothing is printed in console
@echo off

REM Clear the console
cls

REM Run kali linux image and keep all your work running in that image
docker run -ti --rm --mount src=kali-root,dst=/root --mount src=kali-postgres,dst=/var/lib/postgresql my-kali