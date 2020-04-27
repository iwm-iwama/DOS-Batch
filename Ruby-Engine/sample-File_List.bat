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

FromDir = %q(..)

# ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
# 設定ここまで

Signal.trap(:INT) do
	exit
end

require 'find'

a1 = []

# Dir/Fileリスト
Find.find(FromDir) do
	|fn|
	fn = File.expand_path(fn).gsub("/", "\\")
	if File.directory?(fn)
		fn += "\\"
	end
	a1 << fn
end

# 大文字・小文字を区別しない
a1.sort! do
	|s1, s2|
	rtn = s1.casecmp(s2)
	rtn == 0 ? s1 <=> s2 : rtn
end

# 表示
a1.each do
	|e|
	puts e
end

exit
