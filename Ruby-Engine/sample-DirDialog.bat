@echo off
@cls
@ruby -x "%~f0" %*
@echo.
@pause
@exit /b

#!ruby
#-----------------------------------
# for ActiveScriptRuby 1.8.7
# https://www.artonx.org/data/asr/
#-----------------------------------

Signal.trap(:INT) do
	exit
end

while true
	s1 = %x(iwm_DirDialog.exe)
	break if s1.size == 0
	puts s1
end
