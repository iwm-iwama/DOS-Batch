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

# 設定ここから
# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

Msg = <<'EOD' # 非展開
あああ\\ああ^\tいい\いいい
ううううう^\n^\n
えええええ\nkf
おおおおお
EOD

Result = %x(dir .)

# ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
# 設定ここまで

Signal.trap(:INT) do
	exit
end

def SubStatus()
	puts %($?.exitstatus=#{$?.exitstatus}\n$?.pid=#{$?.pid})
end

p %x(iwm_MsgBox.exe)
SubStatus()

p %x(iwm_MsgBox.exe -size=300,160 -title="タ\=イ ト=ル" -text="#{Msg}" -button=1,1)
SubStatus()

p %x(iwm_MsgBox.exe -text="#{Result}" -button=1,0)
SubStatus()
