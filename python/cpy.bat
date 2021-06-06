REM This batch has the objetive to run with a Dockerfile a docker image of python, compile and run a python program without having to install Python in your machine
REM The current python version that are in use is Python 3 and if you want to change have to go into the Dockerfile

REM Clear console output
cls

REM Check if the user did input a file Name
if "%~1"=="" (
    REM Ask him do to his thing
    echo "Insert a fileName param after the command, like 'cpy zeca.py', the file must be in your current dir"
) else (
    REM Copy the file from the current directory to the Dockerfile's directory
    xcopy "%cd%\%1" %~dp0

    REM Build the docker image
    docker build --build-arg "fileName=%1" --build-arg "dir=%cd%" -t python-build %~dp0
)

REM Check if there was a error building the image
if errorlevel 1 (
    exit /b %errorlevel%
) else (
    REM Clear again the console
    cls

    REM Execute the python builder application from a docker image
    docker run -it python-build %1
)

@echo off
REM In this phase we are going to delete all the trash file that we did input in the Docker/Batch directory, so turn off the echo so that won't be printed in console
del "%~dp0\*.py"