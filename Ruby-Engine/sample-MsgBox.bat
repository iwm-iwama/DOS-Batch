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

# �ݒ肱������
# ����������������������������������������������������������

Msg = <<'EOD' # ��W�J
������\\����^\t����\������
����������^\n^\n
����������\nkf
����������
EOD

Result = %x(dir .)

# ����������������������������������������������������������
# �ݒ肱���܂�

Signal.trap(:INT) do
	exit
end

def SubStatus()
	puts %($?.exitstatus=#{$?.exitstatus}\n$?.pid=#{$?.pid})
end

p %x(iwm_MsgBox.exe)
SubStatus()

p %x(iwm_MsgBox.exe -size=240,160 -title="�^\=�C �g=��" -text="#{Msg}" -button=1,1)
SubStatus()

p %x(iwm_MsgBox.exe -text="#{Result}" -button=1,0)
SubStatus()

exit
__END__

:R9
echo.
pause
exit