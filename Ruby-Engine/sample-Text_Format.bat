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

Cmd  = %(dir .)
IFn  = $0
OFn  = "#{IFn}.txt"
CRLF = "\r\n"

# ����������������������������������������������������������
# �ݒ肱���܂�

Signal.trap(:INT) do
	exit
end

$rtn = ""

#-----------
# File�Ǎ�
#-----------
$i1 = 0
File.foreach(IFn) do
	|ln|
	s1 = ln.strip
	$rtn << sprintf("%04d\t%s%s", $i1 += 1, s1, CRLF)
end
$rtn << CRLF

#---------------
# �R�}���h����
#---------------
$i1 = 0
%x(#{Cmd}).split("\n").each do
	|ln|
	s1 = ln.strip

	# "^yyyy/"
	if s1[/^\d{4}\//]
		# ���ʂ� $& �Ŏ擾��
		s1.gsub!(/\s+/, "\t")
		$rtn << sprintf("%04d\t%s%s", $i1 += 1, s1, CRLF)
	end
end

#-------------------------
# ��ʕ\���^�t�@�C���o��
#-------------------------
puts $rtn

File.open(OFn, "wb") do
	|fs|
	fs.write $rtn
end

exit
