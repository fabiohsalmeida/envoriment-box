REM This batch has the objetive to run with a Dockerfile a docker image of python, compile and run a C program without having to install GCC in your machine
REM The uses the most current version of GCC and if you want to change have to go into the Dockerfile

REM Clear console output
cls

REM Check if the user did input a file Name
if "%~1"=="" (
    REM Ask him do to his thing
    echo "Insert a fileName param after the command, like 'car yuna.c', the file must be in your current dir"
) else (
    REM Copy the file from the current directory to the Dockerfile's directory
    xcopy "%cd%\%1" %~dp0

    REM Build the docker image
    docker build --build-arg fileName=%1 -t my-gcc-app %~dp0
)

REM Check if there was a error building the image
if errorlevel 1 (
    exit /b %errorlevel%
) else (
    REM Clear again the console
    cls

    REM Execute the C builder application from a docker image
    docker run -it --rm --name my-running-app my-gcc-app    
)

@echo off
REM In this phase we are going to delete all the trash file that we did input in the Docker/Batch directory, so turn off the echo so that won't be printed in console
del "%~dp0\*.c"