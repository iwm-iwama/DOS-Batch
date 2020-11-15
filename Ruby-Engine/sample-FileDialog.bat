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

# -help
system "iwm_FileDialog.exe -h"

# -nameonly
while true
	s1 = %x(iwm_FileDialog.exe -no)
	if s1.size == 0
		break 
	else
		puts s1.split("\t").join("\n")
	end
	puts
end
