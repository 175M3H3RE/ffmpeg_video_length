@echo off

REM *
REM * ffmpeg video length calculator (time format hh:mm to seconds)
REM *-------------------------------------------------------------

@echo off
set args=%2
set str=%1
set savetofile=ffmpeg.time.list.txt

for /f "tokens=1,2 delims=:" %%i in ("%str%") do set /a hour=%%i&set /a minute=%%j
rem echo z%hour%z
rem echo z%minute%z
set /a hour=hour*60
set /a total=hour+minute
if defined args if "%args%"=="/s" (echo %total%&echo %total% >>%savetofile%) else (goto :eof)
echo %total%