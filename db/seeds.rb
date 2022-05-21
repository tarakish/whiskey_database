# Flavor
[
  ['バニラ', '濃厚な甘さ。華やかさを伴った甘さ。', 0],
  ['はちみつ', '濃密でとろみのある甘さ。他フレーバーとの相性も◯', 0],
  ['キャラメル', '砂糖とバターからくるような優しい甘さ。', 0],
  ['ナッツ', '若干の香ばしさと甘さ、ナッツ由来の油っぽさの絡み合ったフレーバー。', 0],
  ['オークウッド', 'いわゆる樽香。落ち着く木の香り。', 0],
  ['ジンジャー', '喉元をピリッとさせるような刺激感。', 0],
  ['ブラックペッパー', '黒胡椒を挽いた際に感じる、鼻を刺激するようなスパイシーさ。', 0],
  ['シナモン', '焼きリンゴのような甘さと微刺激を感じるフレーバー。', 0],

  ['シェリー', 'ワイン特有の酸味、渋みと甘さ。', 1],

  ['ドライフルーツ', '少しの苦味と酸味を伴った果実感。', 2],
  ['洋なし', '上品な甘さ。豊かで奥行きも感じるような甘さ。', 2],
  ['ピーチ', 'マイルドな果実感と瑞々しいジューシーさ。', 2],
  ['パイナップル', '酸味と甘さの絶妙なバランス感を指す。甘さはさっぱりめ。', 2],
  ['メロン', '濃く柔らかな甘さと、かすかに感じる心地良い青さ。', 2],
  ['トロピカルフルーツ', '南国の濃厚なフルーツ感を指すフレーバー。', 2],
  ['柑橘系', '爽やかさやフルーティな酸味。レモン、ライムなど。', 2],

  ['ミント', '爽快感、すっきりとした清涼感。', 3],
  ['バラ', '花の強い香り。味わいよりも香りにフォーカスした表現。', 3],
  ['ヘザー', '和名ヒース。採れる蜜の印象から甘く濃醇な香りを指す。', 3],
  ['ラベンダー', '比較的優しく、柔らかい花の香り。', 3],

  ['モルト', '麦芽感。素朴な甘さ、香ばしさ。', 4],
  ['ビスケット', '麦の持つ甘さを存分に感じるフレーバー。', 4],
  ['ブレッド', '麦の旨みを感じつつも、どこかさっぱりとした印象も。', 4],
  ['チョコレート', 'カカオの香りと、ビターでとろっとした甘さ。', 4],

  ['ピーティ', '心地よい煙香。通が好きなやつ。', 5],
  ['ヨード香', '海や海藻、潮の香りを伴った煙香。', 5],
  ['燻製', 'カリッと焼いたベーコンのような燻香。', 5]
].each do |name, detail, num|
  Flavor.create!(
    { name: name, detail: detail, group: num }
  )
end

# DrinkWay
[
  [1, 'ハイボール', 'whiskey-and-soda',
    'アルコール感を緩和し、炭酸による香りの広がりを楽しめる飲み方。
    食中でも楽しめるほどの飲みやすさ、爽やかさも。
    香りやアルコールの刺激が強いウイスキーにオススメ。', 
    'https://youtu.be/8m1ZUxQpS_o?t=467'
  ],
  [2, 'オン・ザ・ロック', 'on-the-rocks',
    '溶ける氷による味わいの変化を楽しめる飲み方。
    せっかくならグラスにもこだわって見た目も楽しみたい。
    味や香りが強いもの、高アルコールのウイスキーにオススメ。',
    'https://youtu.be/8m1ZUxQpS_o?t=247'
  ],
  [3, 'ストレート', 'neat',
    'ウイスキーの個性を余すことなく感じられる飲み方。
    空気のとの接触による香りの変化も楽しめる。
    リフレッシュ＆酔い防止のチェイサーも忘れずに。',
    'https://youtu.be/8m1ZUxQpS_o?t=34'
  ],
  [4, 'トゥワイス・アップ', 'twice-up',
    '度数を下げて飲みやすく、風味はより豊かに感じられる飲み方。
    まずは基本の1:1で。慣れたら自分好みの割合で。
    それでも個性が強すぎる場合は、氷を入れてハーフロックにするのもおすすめ。',
    'https://youtu.be/8m1ZUxQpS_o?t=154'
  ],
  [5, 'ミスト', 'mist',
    '軽やかな口当たりとキリッとした冷たさのある飲み方。
    クラッシュドアイスが見た目にも清涼感を感じさせる。
    暑い季節にはミントと砂糖を加えたミント・ジュレップも絶品。',
    'https://youtu.be/8m1ZUxQpS_o?t=667'
  ],
  [6, '水割り','whiskey-and-water',
    'ウイスキービギナーの入り口でもあり、玄人の探求対象でもある
    シンプルな作り方ゆえに奥深い飲み方。ジャパニーズウイスキーは
    水割りにしても味のバランスが崩れないように作られているとか。',
    'https://youtu.be/8m1ZUxQpS_o?t=347'
  ]
].each do |id, name, english_name, explanation, how_to_make_url|
  DrinkWay.create!(
    { id: id, name: name, english_name: english_name, explanation: explanation, how_to_make_url: how_to_make_url }
  )
end

# Snack
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
