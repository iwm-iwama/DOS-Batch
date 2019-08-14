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

# 設定ここから
# ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓


# ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
# 設定ここまで

Signal.trap(:INT) do
	exit
end

# ヘッダー表示
cmd = 0
while cmd == 0
	system %(cls)
	puts  "-" * 40
	puts  "  1."
	puts  "  2."
	puts  "  9. 終　了"
	puts  "-" * 40
	print "  番号 ? "

	begin
		cmd = gets.strip.to_i
	rescue
		puts
		exit
	end

	case cmd
		when 9
			exit

		when 2
			puts "2"

		when 1
			puts "1"

		else
			redo
	end
	cmd = 0

	puts
	system %(pause)
end

exit
__END__

:R9
echo.
exit
