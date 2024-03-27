@echo off
if "%1" NEQ "chutiya" start cmd /k ""%~fp0" chutiya"&goto :eof
set /a counter=0
set /a run_formickeymouse=0
:funky_loooper
title fUNkY raBBiT (C} slEAZY Soul .
echo *
echo * video length calculator (time format hh:mm to seconds)
echo *-------------------------------------------------------------
echo [[[[]     Usage: Enter time in MM:SS or HH:MM:SS           []]]]
echo.secret command: youtube/clear youtube
(if defined run_formickeymouse if %run_formickeymouse%==1 Exit /B)
:looper
set /a hour=0
set /a minute=0
set /a seconds=0
if defined watchis for /f "tokens=*" %%i in ("https://www.youtube.com/watch?v=%watchis%&t=%total%") do echo %%i
set str=
echo|set /p=^^^>
set /p str=
set /a come_here=0
call :seterrorlevel989
if %come_here%==1 goto next_X
goto afterseterrorlevel
:seterrorlevel989
Exit /B 989  
:afterseterrorlevel
echo %str% >NUL
if %errorlevel%==9009 set str="%str%"
echo %str%|find ")"&&(echo.Illegal Char&goto looper)
echo %str%| findstr /r "["\"]"&&echo."FOUND erroneous character...."&&(for /f "tokens=1 delims=&()" %%i in (%str%) do set str=%%i)
(if "%str%"==""  goto looper)
if %errorlevel%==989 echo.check quote&goto looper
if %errorlevel%==9009 echo.check invalid quoting&goto looper
echo %str%|find "clear youtube" >NUL&&(for /f "tokens=1,2 delims= " %%i in ("%str%") do set str=%%i %%j) || (set str=%str: =%)
if /I "%str%"=="cls"  (cls&goto funky_loooper)
if /I "%str%"=="exit"  (Exit /B)
if /I "%str%"=="clear youtube"  (set watchis=&goto looper)
if /I "%str%" NEQ "youtube"  (goto continue)
:enterurl
set /p youtube_url=Enter Url 
set /a come_here=1
CALL :seterrorlevel989
:next_X
echo %youtube_url%
if %errorlevel%==9009 Cls&set /a run_formickeymouse=1&CALL :funky_loooper&set youtube_url="%youtube_Url%"
set /a run_formickeymouse=0
echo %youtube_url% | findstr /r "["\"]"&&for /f "tokens=1 delims=&" %%i in (%youtube_url%) do set youtube_url=%%i
echo %youtube_url% | findstr /r "["\"]"&&for /f "tokens=*" %%i in (%youtube_url%) do set youtube_url=%%i
if %errorlevel%==989 echo.check quote&goto enterurl
if %errorlevel%==9009 echo.RAN ERROR due to ampersand in Url..Never mind&goto enterurl
echo %youtube_url% | find "&"&&(for /f "tokens=1 delims=&" %%i in ("%youtube_url%") do set youtube_url="%%i") || (for /f "tokens=*" %%i in ("%youtube_url%") do set youtube_url="%%i")
if %errorlevel%==989 echo.check quote&goto enterurl
echo %youtube_url%
set youtube_url=%youtube_url: =%
for /f "tokens=*" %%i in (%youtube_url%) do set youtube_url=%%i

set /a pass=0
:youtube


set /a tokens=5
(echo %youtube_url%|findstr /r "^https://youtu.be/") >NUL&&(goto processyoutu.be)
if %errorlevel%==9009 goto nowell
(echo %youtube_url%|findstr /r "^http://youtu.be/") >NUL&&(goto processyoutu.be)
if %errorlevel%==9009 goto nowell
(echo %youtube_url%|findstr /r "^https://youtube.com/") >NUL&&(goto processyoutube)
if %errorlevel%==9009 goto nowell
(echo %youtube_url%|findstr /r "^http://youtube.com/") >NUL&&(goto processyoutube)
if %errorlevel%==9009 goto nowell
(echo %youtube_url%|findstr /r "^https://www.youtube.com/") >NUL&&(goto wwwprocessyoutube)
if %errorlevel%==9009 goto nowell
(echo %youtube_url%|findstr /r "^http://www.youtube.com/") >NUL&&(goto wwwprocessyoutube)
if %errorlevel%==9009 goto nowell
goto continue
:nowell
for /f "tokens=*" %%i in (%youtube_url%) do set youtube_url="%%i"
for /f "tokens=1 delims=&" %%i in (%youtube_url%) do set youtube_url="%%i"
for /f "tokens=*" %%i in (%youtube_url%) do set youtube_url=%%i
goto youtube
:processyoutu.be
set /a tokens=4
for /f "tokens=%tokens% delims=.:?/" %%i in ("%youtube_url%") do set watchis=%%i
goto printwatchis
:wwwprocessyoutube

set /a tokens=7
for /f "tokens=%tokens% delims=^=.:?/" %%i in ("%youtube_url%") do set watchis=%%i
goto printwatchis
:processyoutube

set /a tokens=6
for /f "tokens=%tokens% delims=^=.:?/" %%i in ("%youtube_url%") do set watchis=%%i
goto printwatchis
:printwatchis
if defined watchis set str=&set /p str=-^>
:continue
set nonsense_bydefault=%%i
@echo off
rem set args=%2
rem set str=%1
set str=%str:.=:%
set str=%str: =%

set savetofile=ffmpeg.time.list.txt
set tokens_found=
for /f "tokens=3 delims=:" %%i in ("%str%") do set tokens_found=%%i
if "%tokens_found%"=="" goto skip3
if "%tokens_found%" NEQ "%nonsense_bydefault%" (echo %tokens_found%|findstr /r "^[0-9]*$" >NUL&&(goto process3) || (echo.Invalid Third Char Found&goto looper) )

:skip3
title video length calc.
echo %str%|findstr /r "^[0-9:.]*$">NUL&&echo.>NUL || (echo.Non-number or invalid command&timeout 5 >NUL&cls&goto funky_loooper)
set stumped=%%j
for /f "tokens=1,2 delims=:" %%i in ("%str%") do set /a hour=%%i&if "x%%jx" NEQ "xx" set /a minute=%%j
echo %hour%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number&goto looper)
echo %minute%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number&goto looper)
set /a hour=hour*60
set /a total=hour+minute
if defined args if "%args%"=="/s" (echo %total% >>%savetofile%) 
echo %total% seconds
goto :save
:process3
title video length calc.
for /f "tokens=1,2,3 delims=:" %%i in ("%str%") do set /a hour=%%i&set /a minute=%%j&set /a seconds=%%k
set /a hour=hour*60*60
set /a minute=minute*60
set /a total=hour+minute+seconds
echo %hour%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number&goto looper)
echo %minute%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number&goto looper)
echo %seconds%|findstr /r "^[0-9]*$">NUL&&echo.>NUL || (echo.Non-number&goto looper)

if defined args if "%args%"=="/s" (echo.X&echo %total% >>%savetofile%) 
echo %total% seconds
:save
goto looper
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
