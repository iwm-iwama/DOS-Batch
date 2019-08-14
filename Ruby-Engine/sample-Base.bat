@echo off
cls
call .\ruby.exe -Sx -Ks %0 %*
goto R9

:R0
#!ruby
#-----------------------------------
# for ActiveScriptRuby 1.8.7
# https://www.artonx.org/data/asr/
#-----------------------------------

# İ’è‚±‚±‚©‚ç
# «««««««««««««««««««««««««««««

# ”ñ“WŠJ
Msg1 = %q(\Hello\nRuby!!)

# ”ñ“WŠJ
Msg2 = <<'EOD'
1)\Hello\nRuby!!
2)\Hello\nRuby!!
EOD

# ªªªªªªªªªªªªªªªªªªªªªªªªªªªªª
# İ’è‚±‚±‚Ü‚Å

Signal.trap(:INT) do
	exit
end

puts Time.now.strftime("%Y-%m-%d %H:%M:%S %a")
puts %x(./ruby -v).strip
puts

p Msg1
puts Msg1
puts

p a1 = Msg2.split("\n")
a1.each do
	|e|
	puts e
end

exit
__END__

:R9
echo.
pause
exit
