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

# �ݒ肱������
# ����������������������������������������������������������

# ��W�J
Msg1 = %q(\Hello\nRuby!!)

# ��W�J
Msg2 = <<'EOD'
1)\Hello\nRuby!!
2)\Hello\nRuby!!
EOD

# ����������������������������������������������������������
# �ݒ肱���܂�

Signal.trap(:INT) do
	exit
end

puts Time.now.strftime("%Y-%m-%d %H:%M:%S %a")
puts %x(./ruby -v).strip
puts

puts Msg1

a1 = Msg2.split("\n")
a1.each do
	|e|
	puts e
end

exit
