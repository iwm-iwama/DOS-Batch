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
あああ\\ああ\\\tいい\いいい
ううううう\\n\\n
えええええ\nkf\
\tおおおおお
EOD

Result = %x(dir .)

# ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
# 設定ここまで

Signal.trap(:INT) do
	exit
end

def SubStatus()
	puts %($?.exitstatus=#{$?.exitstatus}\n$?.pid=#{$?.pid})
	puts
end

puts %x(iwm_MsgBox.exe)
SubStatus()

puts %x(iwm_MsgBox.exe -size=300,160 -title="タイトル" -text="#{Msg}" -button=1,1 -checkbox="上記内容を承諾します。")
SubStatus()

puts %x(iwm_MsgBox.exe -text="#{Result}" -button=1,0)
SubStatus()
