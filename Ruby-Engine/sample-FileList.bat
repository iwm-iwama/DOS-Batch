@echo off
@cls
@ruby -x "%~f0" %*
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

def
main()
	# Esc�F���g�����܂��Ȃ�
	system "cls"

	a1 = []

	# Dir/File���X�g
	Find.find(FromDir) do
		|_s|
		_s = File.expand_path(_s).gsub("/", "\\")
		if File.directory?(_s)
			_s = "\e[0;96m#{_s}\\\e[0;99m"
		end
		a1 << _s
	end

	# �啶���E����������ʂ��Ȃ�
	a1.sort! do
		|_1, _2|
		rtn = _1.casecmp(_2)
		rtn == 0 ? _1 <=> _2 : rtn
	end

	# �\��
	a1.each do
		|_s|
		puts _s
	end
end

main()
