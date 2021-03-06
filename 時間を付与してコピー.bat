::---------------------------------------------------------
:: Ver.Iwm20210613
::   copy "aaa.c" "yyyymmdd_hhnnss\aaa_yyyymmdd_hhnnss.c"
::---------------------------------------------------------
@echo off

set NOW=%DATE%_%TIME:~0,8%

:: 日付フォーマットが yymmdd のとき
if "%NOW:~2,1%" == "/" (
	set NOW=20%NOW%
)

:: " " を "0"  に変換
:: "/" を NULL に変換
:: ":" を NULL に変換
set NOW=%NOW: =0%
set NOW=%NOW:/=%
set NOW=%NOW::=%

set NewDir=%~dp1%NOW%

md %NewDir%

:R0
	set iFn=%~dpn1%~x1
	set oFn=%NewDir%\%~n1_%NOW%%~x1

	copy /y /v "%iFn%" "%oFn%"

	shift
	if "%1" == "" goto R9
	goto R0
:R9
	exit
