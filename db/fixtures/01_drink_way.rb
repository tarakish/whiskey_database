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