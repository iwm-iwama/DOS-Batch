::---------------------------------------------------------
:: Ver.Iwm20140211
:: Microsoftは信用しないで使え!!
::---------------------------------------------------------
@echo off

:: ~ で " を削除してから " を逐次付与
::
set iFn=%~1
set oFn=%~2

if not exist "%iFn%" (
	echo 入力ファイルが存在しない!
	goto :R_end
)

if not exist "%oFn%" (
	echo 出力ファイルが存在しない!
	goto :R_end
)

	echo 上書きコピーします!!
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
