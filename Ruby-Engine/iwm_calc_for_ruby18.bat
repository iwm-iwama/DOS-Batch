@echo off
@cls
@ruby -x "%~f0" %*
@exit /b

#!ruby
#-----------------------------------
# for ActiveScriptRuby 1.8.7
# https://www.artonx.org/data/asr/
#-----------------------------------

VER = "iwm20210401 for Ruby1.8"

Signal.trap(:INT) do
	exit
end

HELP = <<EOD
---------------------------------------------------
|【コマンド】                                     |
|  Enter      計算実行                            |
|  入力 > Enter                                   |
|    q        終了                                |
|    r        再起動                              |
|    a        変数一覧                            |
|    d        変数全消去                          |
|    dn       変数[n]消去  d0, d1...              |
|  Space > ↑ or ↓  入力履歴                     |
---------------------------------------------------
|【数式】                                         |
|  pi         π = 3.14159265358979               |
|  *          3*2     => 6                        |
|  /          3/2     => 1                        |
|             3.0/2.0 => 1.5                      |
|  %          3%2     => 1                        |
|  +          3+2     => 5                        |
|  -          3-2     => 1                        |
|  **         3**2    => 9                        |
|  sqrt(n)    sqrt(4) => 2.0                      |
|  sin(n°)   sin(30) => 0.5                      |
|  cos(n°)   cos(60) => 0.5                      |
|  tan(n°)   tan(45) => 1.0                      |
---------------------------------------------------
|【例】                                           |
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

def
main()
	$AryVar = []
	$Exec = ""

	# Esc色を使うおまじない
	system "cls"

	puts "\e[0;92;44m Ver.#{VER} "
	print "\e[0;97;44m#{HELP}\e[0;99m"

	print "> "
	while (line = STDIN.gets.strip)
		case line
			when ""
				begin
					_s1 = ""
					$AryVar.each do
						|_s|
						_s1 << _s + ";"
					end
					_s1 << $Exec

					# Math::PI / 180
					_PiPerDeg = 0.017453292519943295

					# Math関係／大小文字を区別しない
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
					|_s|
					printf("[%d] %s\n", _i1, _s)
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
					|_s|
					printf("[%d] %s\n", _i1, _s)
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
