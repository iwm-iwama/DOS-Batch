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

Text = <<'EOD' # 非展開
C:\Program Files\GIMP 2\32\bin;c:\mingw\bin;C:\msys64\usr\bin;c:\program files (x86)\intel\intel(r) management engine components\dal;c:\program files (x86)\intel\intel(r) management engine components\ipt;c:\program files (x86)\nvidia corporation\physx\common;c:\program files\intel\icls client\;c:\program files\intel\intel(r) management engine components\dal;c:\program files\intel\intel(r) management engine components\ipt;c:\program files\nvidia corporation\nvidia nvdlisr;c:\ruby\bin;c:\windows;c:\windows\microsoft.net\framework64\v4.0.30319;c:\windows\system32;c:\windows\system32\openssh\;c:\windows\system32\wbem;c:\windows\system32\windowspowershell\v1.0\;%systemroot%;%systemroot%\system32;%systemroot%\system32\openssh\;%systemroot%\system32\wbem;%systemroot%\system32\windowspowershell\v1.0\;C:\Program Files\dotnet\;%SystemRoot%\system32;%SystemRoot%;%SystemRoot%\System32\Wbem;%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\;%SYSTEMROOT%\System32\OpenSSH\;C:\Program Files\Git\cmd
EOD

Separator = ";"

# ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑
# 設定ここまで

Signal.trap(:INT) do
	exit
end

a1 = Text.split(Separator)

#-------
# Sort
#-------
puts "[変更前]"
	# 大文字・小文字を区別しない
	a1.sort! do
		|s1, s2|
		rtn = s1.casecmp(s2)
		rtn == 0 ? s1 <=> s2 : rtn
	end

	a1.each do
		|ln|
		puts ln
	end
puts

#-------
# Uniq
#-------
puts "[変更後]"
	s1 = ""
	a2 = []
	a1.each do
		|ln|
		if ln.downcase != s1.downcase
			a2 << ln	
			s1 = ln
		end
	end

	a2.each do
		|ln|
		puts ln
	end
puts

#------------
# Clipboard
#------------
puts "[クリップボードにコピー済]"
	s1 = a2.join(";")
	puts s1

	tFn = "#{$$}.$$"
	File.open(tFn, "wb") do
		|oFs|
		oFs.write s1
	end
	system %(clip.exe < #{tFn})
	File.delete tFn
puts

exit
__END__

:R9
echo.
pause
exit
