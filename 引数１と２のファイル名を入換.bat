::---------------------------------------------------------
:: Ver.Iwm20140211
:: Microsoft�͐M�p���Ȃ��Ŏg��!!
::---------------------------------------------------------
@echo off

:: ~ �� " ���폜���Ă��� " �𒀎��t�^
::
set iFn=%~1
set iFn2=%~nx1

set oFn=%~2
set oFn2=%~nx2

if not exist "%iFn%" (
	echo ���̓t�@�C�������݂��Ȃ�!
	goto :R_end
)

if not exist "%oFn%" (
	echo �o�̓t�@�C�������݂��Ȃ�!
	goto :R_end
)

	echo ���l�[�����܂�!!
	echo ^  "%iFn2%" �� "%oFn2%"
	echo.
	pause

	ren "%iFn%"     "%iFn2%.$$$"
	ren "%oFn%"     "%iFn2%"
	ren "%iFn%.$$$" "%oFn2%"

	exit

:R_end
	echo.
	pause
	exit
