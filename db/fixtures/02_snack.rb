[
  [1, 'チョコレート', 'chocolate',
    'ウイスキー入りのチョコがあるのも納得の相性。
    基本的はハイカカオなものが合いやすいが、ミルクチョコを比べてみるのもオススメ。'],
  [2, 'ナッツ', 'nuts', 
    '定番中の定番。ストレートで飲むウイスキーと相性◯。
    繊細なものには無塩ナッツ、香りの強いものには塩味の効いたナッツを。'],
  [3, 'チーズ', 'cheese',
    'スモークチーズだとなお良し。
    長熟のウイスキーに長熟のチーズを合わせるなど、楽しみ方も幅広い。'],
  [4, 'ドライフルーツ', 'drid fruit',
    'フルーティな印象を持つウイスキーとの相性が抜群。
    どんなドライフルーツが合うのか、食べ比べてみると新たな発見があるかも。'],
  [5, 'アイスクリーム', 'ice cream',
    'ウイスキーをかけて食べるバニラアイスの悪魔的魅力。
    くれぐれもペースには注意してお試しあれ。'],
  [6, 'ソーセージ', 'sausage',
    'ジューシーな肉汁あふれるソーセージは、
    個性強め、度数高めのマシマシなウイスキーにもよく合う。'],
  [7, 'フライフード', 'fried foods',
    'フライドポテト、唐揚げ、ポテトチップスなどはハイボールと抜群の相性。
    魚のフライなど淡白なものは、繊細なウイスキーでしっぽり楽しみたい。'],
  [8, '野菜スティック', 'vegetable stick',
    '繊細な味や軽やかな飲み口、水割りなどと相性の良いおつまみ。
    特に根拠はないけれど、罪悪感も消してくれそう。'],
  [9, 'ゆで卵', 'boiled egg',
    'すこし風味の強いウイスキーを水割り、ハーフロックなど加水して飲む際によく合う。
    ウイスキーを強く感じたら塩を加えてみるのもオススメ。燻製卵はスモーキーなものに合わせて。'],
  [10, 'スモークサーモン', 'smoked salmon',
    '魚介の風味と塩味はよく冷えたウイスキーと相性抜群。
    味付けの濃さでウイスキーを選ぶのも、楽しみ方のひとつ。'],
  [11, 'ガーリックシュリンプ', 'garlic shrimp',
    '魚介の旨味とガーリックの刺激が食欲を誘うおつまみ。
    アイラ島のスモーキーなウイスキーと合わせたい。']
].each do |id, name, english_name, description|
  Snack.create!(
    { id: id, name: name, english_name: english_name, description: description }
  )
end