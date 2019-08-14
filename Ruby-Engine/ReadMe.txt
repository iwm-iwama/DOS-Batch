【RubyでDOSバッチファイルを作成】20190814

・本構成は、DOSバッチファイルにRubyを組み込み、
　例えば「ruby.exe sample.rb」ではなく「sample.bat」として実行します。

・スタンドアロン環境におけるテキスト処理を想定し、外部コマンドで処理を補完可能です。

・ActiveRuby1.8.7[*1]を使用し、「ruby.exe」「msvcrt-ruby18.dll」の２ファイルで動作します。
　各種ライブラリファイル（fileutil.rb, find.rb, nkf.so 等）により機能の拡張が可能です。

　　[*1] https://www.artonx.org/data/asr/
