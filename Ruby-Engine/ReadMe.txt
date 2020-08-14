【RubyでDOSバッチファイルを作成】20190814初版／20200814改訂

・本構成は、DOSバッチファイルにRubyを組み込み、
　例えば「ruby.exe sample.rb」ではなく「sample.bat」として実行します。

・ActiveRuby1.8.7[*1]を使用し、「ruby.exe」「msvcrt-ruby18.dll」の２ファイルで動作します。
　各種ライブラリファイル（fileutil.rb, find.rb, nkf.so 等）により機能の拡張が可能です。

　　[*1] https://www.artonx.org/data/asr/
