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

FromDir = %q(..)

# ����������������������������������������������������������
# �ݒ肱���܂�

Signal.trap(:INT) do
	exit
end

require 'find'

a1 = []

# Dir/File���X�g
Find.find(FromDir) do
	|fn|
	fn = File.expand_path(fn).gsub("/", "\\")
	if File.directory?(fn)
		fn += "\\"
	end
	a1 << fn
end

# �啶���E����������ʂ��Ȃ�
a1.sort! do
	|s1, s2|
	rtn = s1.casecmp(s2)
	rtn == 0 ? s1 <=> s2 : rtn
end

# �\��
a1.each do
	|e|
	puts e
end

exit
