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

OFn = "sample.sqlite3"

TSV = <<'EOD' # ��W�J
1	����������
2	�\��
3	�����
EOD

# ����������������������������������������������������������
# �ݒ肱���܂�

Signal.trap(:INT) do
	exit
end

require 'nkf'

$rtn = ""

#----------------------------------
# OFn �����݂��Ă��Ȃ���� DB�쐬
#----------------------------------
if ! File.exist? OFn
	system %(sqlite3.exe #{OFn} "CREATE TABLE T_01(id INTEGER, name TEXT);")
end

#---------
# DB����
#---------
# TmpFile �쐬
tFn = "#{$$}.$$"
File.open(tFn, "wb") do
	|oFs|

	# Sqlite3 ��utf-8�Ή��Ȃ̂ŃR�[�h�ϊ�
	oFs.write NKF.nkf("-w -x", TSV)

	#
	#�y�t�@�C�����͗�z
	#File.open("aaa.txt", "rb") do
	#	|iFs|
	#	oFs.write NKF.nkf("-w -x", iFs.read)
	#end
	#
end

# TSV�C���|�[�g "\t"
system %(sqlite3.exe -separator "\t" #{OFn} ".import #{tFn} T_01")

# TmpFile �폜
File.delete tFn

#---------
# DB�o��
#---------
sUtf8 = %x(sqlite3.exe #{OFn} "SELECT * FROM T_01;")

# shift_jis�ɕϊ��^�o��
puts $rtn = NKF.nkf("-s -x -Lw", sUtf8)

#
#�y�t�@�C���o�͗�z
#File.open("aaa.txt", "wb") do
#	|oFs|
#	oFs.write $rtn
#end
#
