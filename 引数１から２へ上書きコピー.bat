::---------------------------------------------------------
:: Ver.Iwm20140211
:: Microsoft�͐M�p���Ȃ��Ŏg��!!
::---------------------------------------------------------
@echo off

:: ~ �� " ���폜���Ă��� " �𒀎��t�^
::
set iFn=%~1
set oFn=%~2

if not exist "%iFn%" (
	echo ���̓t�@�C�������݂��Ȃ�!
	goto :R_end
)

if not exist "%oFn%" (
	echo �o�̓t�@�C�������݂��Ȃ�!
	goto :R_end
)

	echo �㏑���R�s�[���܂�!!
	echo ^  From : %iFn%
	echo ^    To : %oFn%
	echo.
	pause

copy /b "%iFn%" /b "%oFn%"
exit

:R_end
	echo.
	pause
	exit
