@echo off

REM *
REM * ffmpeg video length calculator (time format hh:mm to seconds)
REM *-------------------------------------------------------------


set nonsense_bydefault=%%i
@echo off
set args=%2
set str=%1
set savetofile=ffmpeg.time.list.txt
set tokens_found=
for /f "tokens=3 delims=:" %%i in ("%str%") do set tokens_found=%%i

if "%tokens_found%"=="" goto skip3
if "%tokens_found%" NEQ "%nonsense_bydefault%" (echo %tokens_found%|findstr /r "^[0-9]*$" >NUL&&(goto process3) || (echo.Invalid Third Char Found&goto:eof) )

:skip3
for /f "tokens=1,2 delims=:" %%i in ("%str%") do set /a hour=%%i&set /a minute=%%j
echo %hour%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto :eof)
echo %minute%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto :eof)
set /a hour=hour*60
set /a total=hour+minute
if defined args if "%args%"=="/s" (echo %total% >>%savetofile%) 
echo %total%
goto :eof
:process3
for /f "tokens=1,2,3 delims=:" %%i in ("%str%") do set /a hour=%%i&set /a minute=%%j&set /a seconds=%%k
set /a hour=hour*60*60
set /a minute=minute*60
set /a total=hour+minute+seconds
echo %hour%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto :eof)
echo %minute%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto :eof)
echo %seconds%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto :eof)

if defined args if "%args%"=="/s" (echo %total% >>%savetofile%) 
echo %total%
