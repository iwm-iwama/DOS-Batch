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

VERSION = "iwm20200419 for Ruby1.8"

Signal.trap(:INT) do
	exit
end

HELP = <<EOD
---------------------------------------------------
|�y�R�}���h�z                                     |
|  Enter      �v�Z���s                            |
|  ���� > Enter                                   |
|    q        �I��                                |
|    r        �ċN��                              |
|    a        �ϐ��ꗗ                            |
|    d        �ϐ��S����                          |
|    dn       �ϐ�[n]����  d0, d1...              |
|  Space > �� or ��  ���͗���                     |
---------------------------------------------------
|�y�����z                                         |
|  pi         �� = 3.14159265358979               |
|  *          3*2     => 6                        |
|  /          3/2     => 1                        |
|             3.0/2.0 => 1.5                      |
|  %          3%2     => 1                        |
|  +          3+2     => 5                        |
|  -          3-2     => 1                        |
|  **         3**2    => 9                        |
|  sqrt(n)    sqrt(4) => 2.0                      |
|  sin(n��)   sin(30) => 0.5                      |
|  cos(n��)   cos(60) => 0.5                      |
|  tan(n��)   tan(45) => 1.0                      |
---------------------------------------------------
|�y��z                                           |
|  > i1 = pi                                      |
|  > i2 = 180                                     |
|  > a                                            |
|  [0] i1 = pi                                    |
|  [1] i2 = 180                                   |
|  > i1 / i2                                      |
|  >                                              |
|  0.0174532925199433                             |
---------------------------------------------------
EOD

def main()
	$AryVar = []
	$Exec = ""

	if ! system "cls"
		system "clear"
	end

	print "\e[1;32m\e[44m"
		puts " Ver.#{VERSION} "
	print "\e[0;37m\e[44m"
		puts HELP
	print "\e[49m"

	print "> "
	while (line = STDIN.gets.strip)
		case line
			when ""
				begin
					_s1 = ""
					$AryVar.each do
						|s|
						_s1 << s + ";"
					end
					_s1 << $Exec

					# Math::PI / 180
					_PiPerDeg = 0.017453292519943295

					# Math�֌W�^�召��������ʂ��Ȃ�
					_s1.gsub!(/Math::/i, "")
					_s1.gsub!(/pi/i, "Math::PI")
					_s1.gsub!(/sqrt\(/i, "Math::sqrt(")
					_s1.gsub!(/sin\((.+?)\)/i){ "Math::sin(#{$1} * #{_PiPerDeg})" }
					_s1.gsub!(/cos\((.+?)\)/i){ "Math::cos(#{$1} * #{_PiPerDeg})" }
					_s1.gsub!(/tan\((.+?)\)/i){ "Math::tan(#{$1} * #{_PiPerDeg})" }

					puts eval(_s1).to_s
				rescue => e
					puts "[Err] " + e.to_s
				end

			when "q", "Q"
				break

			when "r", "R"
				main()
				break

			when "a", "A"
				_i1 = 0
				$AryVar.each do
					|s|
					printf("[%d] %s\n", _i1, s)
					_i1 += 1
				end
				line = ""

			when "d", "D"
				$AryVar = []
				line = ""

			when /d\d+/i
				$AryVar.delete_at(line[1 .. -1].to_i)
				_i1 = 0
				$AryVar.each do
					|s|
					printf("[%d] %s\n", _i1, s)
					_i1 += 1
				end
				line = ""
		end

		if line.include?("=")
			$AryVar << line
			$Exec = ""
		else
			$Exec = line
		end

		print "> "
	end
end

main()
exit
__END__

:R9
echo.
exit
