::-------------------------------------------
:: Ver.Iwm20190327
::   copy "aaa.c" "aaa_yyyymmdd.c"
::-------------------------------------------
@echo off

set NOW=%DATE%

:: ���t�t�H�[�}�b�g�� yymmdd �̂Ƃ�
if "%NOW:~2,1%" == "/" (
	set NOW = 20%NOW%
)

:: " " �� "0"  �ɕϊ�
:: "/" �� NULL �ɕϊ�
set NOW=%NOW: =0%
set NOW=%NOW:/=%

:R0
	set iFn=%~dpn1%~x1
	set oFn=%~dpn1_%NOW%%~x1

	copy /y /v "%iFn%" "%oFn%"

	shift
	if %1 == "" goto R9
	goto R0
:R9
	exit
