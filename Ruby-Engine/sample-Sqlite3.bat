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

OFn = "sample.sqlite3"

TSV = <<'EOD' # 非展開
1	あいうえお
2	表示
3	ｶｷｸｹｺ
EOD

# ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
# 設定ここまで

Signal.trap(:INT) do
	exit
end

require 'nkf'

$rtn = ""

#----------------------------------
# OFn が存在していなければ DB作成
#----------------------------------
if ! File.exist? OFn
	system %(sqlite3.exe #{OFn} "CREATE TABLE T_01(id INTEGER, name TEXT);")
end

#---------
# DB入力
#---------
# TmpFile 作成
tFn = "#{$$}.$$"
File.open(tFn, "wb") do
	|oFs|

	# Sqlite3 はutf-8対応なのでコード変換
	oFs.write NKF.nkf("-w -x", TSV)

	#
	#【ファイル入力例】
	#File.open("aaa.txt", "rb") do
	#	|iFs|
	#	oFs.write NKF.nkf("-w -x", iFs.read)
	#end
	#
end

# TSVインポート "\t"
system %(sqlite3.exe -separator "\t" #{OFn} ".import #{tFn} T_01")

# TmpFile 削除
File.delete tFn

#---------
# DB出力
#---------
sUtf8 = %x(sqlite3.exe #{OFn} "SELECT * FROM T_01;")

# shift_jisに変換／出力
puts $rtn = NKF.nkf("-s -x -Lw", sUtf8)

#
#【ファイル出力例】
#File.open("aaa.txt", "wb") do
#	|oFs|
#	oFs.write $rtn
#end
#
