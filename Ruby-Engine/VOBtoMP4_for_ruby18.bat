@echo off
@cls
@ruby -x "%~f0" %*
@exit /b

#!ruby
#-----------------------------------
# for ActiveScriptRuby 1.8.7
# https://www.artonx.org/data/asr/
#-----------------------------------

VER = "iwm20210511 for Ruby1.8"

Signal.trap(:INT) do
	exit
end

$oFn = Time.now.strftime("output_%Y%m%d_%H%M%S.mp4")
$vob_tmp = "#{$oFn}.vob"

def
main()
	# Esc�F���g�����܂��Ȃ�
	system "cls"

	iFn = ARGV[0]

	if iFn == nil || ! File.exist?(iFn)
		puts
		puts "\e[0;97;104m VOB�t�@�C���i�����j���� MPEG4�t�@�C���𐶐� \e[0;99m"
		puts
		puts "\e[0;97;101m #{File.basename($0)} [VOB File] ... \e[0;99m"
		puts
		puts "\e[0;95m(��)\e[0;99m"
		puts "  \e[0;97m #{File.basename($0)} VTS_01_1.VOB VTS_01_2.VOB VTS_01_3.VOB\e[0;99m"
		puts
		puts "\e[0;93m(��)\e[0;99m"
		puts "  \e[0;97m�ʓr ffmpeg.exe ���K�v�ł��B\e[0;99m"
		puts
		exit
	end

	a1 = []

	ARGV.each do
		|_s|
		a1 << _s
	end

	cmd = "copy /b #{a1.join("+")} #{$vob_tmp}"

	# ���s!!
	system cmd
	system "ffmpeg -i #{$vob_tmp} -map 0:v:0 -map 0:a:0 #{$oFn}"

	if File.exist?($vob_tmp)
		File.delete $vob_tmp
	end
end

main()
