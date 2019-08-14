::---------------------------------------------------------
:: Ver.Iwm20140211
:: Microsoftは信用しないで使え!!
::---------------------------------------------------------
@echo off

:: ~ で " を削除してから " を逐次付与
::
set iFn=%~1
set iFn2=%~nx1

set oFn=%~2
set oFn2=%~nx2

if not exist "%iFn%" (
	echo 入力ファイルが存在しない!
	goto :R_end
)

if not exist "%oFn%" (
	echo 出力ファイルが存在しない!
	goto :R_end
)

	echo リネームします!!
	echo ^  "%iFn2%" ⇔ "%oFn2%"
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
