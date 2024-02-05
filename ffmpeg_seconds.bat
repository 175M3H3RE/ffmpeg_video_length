@echo off
if "%1" NEQ "chutiya" start cmd /c ""%~fp0" chutiya"& goto :eof
set /a counter=0
:funky_loooper
title fUNkY raBBiT (C} slEASY Soul .
echo *
echo * ffmpeg video length calculator (time format hh:mm to seconds)
echo *-------------------------------------------------------------
echo [[[[]     Usage: Enter time in MM:SS or HH:MM:SS           []]]]
echo.Press 1/S Save, (H) Help
:looper
set /a hour=0
set /a minute=0
set /a seconds=0
echo|set /p=^^^>
set /p str=
set nonsense_bydefault=%%i
@echo off
rem set args=%2
rem set str=%1
set str=%str:.=:%
set savetofile=ffmpeg.time.list.txt
set tokens_found=
for /f "tokens=3 delims=:" %%i in ("%str%") do set tokens_found=%%i

if "%tokens_found%"=="" goto skip3
if "%tokens_found%" NEQ "%nonsense_bydefault%" (echo %tokens_found%|findstr /r "^[0-9]*$" >NUL&&(goto process3) || (echo.Invalid Third Char Found&goto looper) )

:skip3
title ffmpeg video length calc.
echo %str%|findstr /r "^[0-9:.]*$">NUL&&echo.>NUL || (echo.Non-number value&timeout 5 >NUL&cls&goto funky_loooper)
set stumped=%%j
for /f "tokens=1,2 delims=:" %%i in ("%str%") do set /a hour=%%i&if "x%%jx" NEQ "xx" set /a minute=%%j
echo %hour%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto looper)
echo %minute%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto looper)
set /a hour=hour*60
set /a total=hour+minute
if defined args if "%args%"=="/s" (echo %total% >>%savetofile%) 
echo %total% seconds
goto :save
:process3
title ffmpeg video length calc.
for /f "tokens=1,2,3 delims=:" %%i in ("%str%") do set /a hour=%%i&set /a minute=%%j&set /a seconds=%%k
set /a hour=hour*60*60
set /a minute=minute*60
set /a total=hour+minute+seconds
echo %hour%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto looper)
echo %minute%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto looper)
echo %seconds%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number value&goto looper)

if defined args if "%args%"=="/s" (echo.X&echo %total% >>%savetofile%) 
echo %total% seconds
:save
echo|set/p= . .  .
choice /c 1ST96habdefgijklmnopqruvwz0234578 /N /m "                 [Enter a key] in 3 seconds:   _   ?" /t 3 /d Z
echo.
set /a boom=0
if %errorlevel%==1 (echo..-X-&echo %total% >>%savetofile%&title Saved to file %savetofile%) 
if %errorlevel%==2 (echo..-X-x-X-.&echo %total% >>%savetofile%&title Saved to file %savetofile%) 
if %errorlevel%==3 if exist  %savetofile% type %savetofile%&set /a boom=1
if %errorlevel%==4 (echo.Clearing file in 30 seconds.&echo.Press any key to clear immediately&echo.Close Window to avoid..&pause >NUL&timeout 30 &del %savetofile%)
if %errorlevel%==5 echo|set/p=.... !! To Clipboard&echo|set/p=%total%|clip&echo.
if %errorlevel%==6 set /a boom=1
if %boom%==1 echo ----------------------------------------------------------------------------------------------------
if %boom%==1 echo  Help Menu ~ (H)  .Show this menu.  -  ^| 1/s = Save ^| t = type/show ^| 9 Delete  ^| 6 Clipboard  ^|
if %boom%==1 echo ----------------------------------------------------------------------------------------------------
set /a counter+=1
if %counter% GTR 20 CLS&set /a counter=0&goto funky_loooper
goto looper
