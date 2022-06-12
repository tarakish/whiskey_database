[
  [1, 'バニラ', '濃厚な甘さ。華やかさを伴った甘さ。', 0],
  [2, 'はちみつ', '濃密でとろみのある甘さ。他フレーバーとの相性も◯', 0],
  [3, 'キャラメル', '砂糖とバターからくるような優しい甘さ。', 0],
  [4, 'ナッツ', '若干の香ばしさと甘さ、ナッツ由来の油っぽさの絡み合ったフレーバー。', 0],
  [5, 'オークウッド', 'いわゆる樽香。落ち着く木の香り。', 0],
  [6, 'ジンジャー', '喉元をピリッとさせるような刺激感。', 0],
  [7, 'ブラックペッパー', '黒胡椒を挽いた際に感じる、鼻を刺激するようなスパイシーさ。', 0],
  [8, 'シナモン', '焼きリンゴのような甘さと微刺激を感じるフレーバー。', 0],

  [9, 'シェリー', 'ワイン特有の酸味、渋みと甘さ。', 1],

  [10, 'ドライフルーツ', '少しの苦味と酸味を伴った果実感。', 2],
  [11, '洋なし', '上品な甘さ。豊かで奥行きも感じるような甘さ。', 2],
  [12, 'ピーチ', 'マイルドな果実感と瑞々しいジューシーさ。', 2],
  [13, 'パイナップル', '酸味と甘さの絶妙なバランス感を指す。甘さはさっぱりめ。', 2],
  [14, 'メロン', '濃く柔らかな甘さと、かすかに感じる心地良い青さ。', 2],
  [15, 'トロピカルフルーツ', '南国の濃厚なフルーツ感を指すフレーバー。', 2],
  [16, '柑橘系', '爽やかさやフルーティな酸味。レモン、ライムなど。', 2],

  [17, 'ミント', '爽快感、すっきりとした清涼感。', 3],
  [18, 'バラ', '花の強い香り。味わいよりも香りにフォーカスした表現。', 3],
  [19, 'ヘザー', '和名ヒース。採れる蜜の印象から甘く濃醇な香りを指す。', 3],
  [20, 'ラベンダー', '比較的優しく、柔らかい花の香り。', 3],

  [21, 'モルト', '麦芽感。素朴な甘さ、香ばしさ。', 4],
  [22, 'ビスケット', '麦の持つ甘さを存分に感じるフレーバー。', 4],
  [23, 'ブレッド', '麦の旨みを感じつつも、どこかさっぱりとした印象も。', 4],
  [24, 'チョコレート', 'カカオの香りと、ビターでとろっとした甘さ。', 4],

  [25, 'ピーティ', '心地よい煙香。通が好きなやつ。', 5],
  [26, 'ヨード香', '海や海藻、潮の香りを伴った煙香。', 5],
  [27, '燻製', 'カリッと焼いたベーコンのような燻香。', 5]
].each do |id, name, detail, num|
  Flavor.create!(
    { id: id, name: name, detail: detail, group: num }
  )
end