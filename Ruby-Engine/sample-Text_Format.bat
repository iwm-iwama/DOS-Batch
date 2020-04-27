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

Cmd  = %(dir .)
IFn  = $0
OFn  = "#{IFn}.txt"
CRLF = "\r\n"

# ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
# 設定ここまで

Signal.trap(:INT) do
	exit
end

$rtn = ""

#-----------
# File読込
#-----------
$i1 = 0
File.foreach(IFn) do
	|ln|
	s1 = ln.strip
	$rtn << sprintf("%04d\t%s%s", $i1 += 1, s1, CRLF)
end
$rtn << CRLF

#---------------
# コマンド結果
#---------------
$i1 = 0
%x(#{Cmd}).split("\n").each do
	|ln|
	s1 = ln.strip

	# "^yyyy/"
	if s1[/^\d{4}\//]
		# 結果は $& で取得可
		s1.gsub!(/\s+/, "\t")
		$rtn << sprintf("%04d\t%s%s", $i1 += 1, s1, CRLF)
	end
end

#-------------------------
# 画面表示／ファイル出力
#-------------------------
puts $rtn

File.open(OFn, "wb") do
	|fs|
	fs.write $rtn
end

exit
