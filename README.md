# whiskey_database(仮)

### サービス概要
ウイスキーに興味がある人に
直感的に次のウイスキーが探せる
ウイスキーデータベースサービス。
### メインのターゲットユーザー
興味はあるものの手が出しにくいと思っている、駆け出しウイスキー好き。または、初心者。
### 解決方法
- ウイスキーに興味が湧いても「分かりにくさ」のせいで手を出しにくい
- 調べてもある程度の知識が求められることが多い
そこでウイスキーの情報、たとえば「味の複雑さ」や「飲み方」などを
できるだけ視覚的かつ直感的に捉えることができれば、「分かりにくさ」を解決できるのではないか？という考えのもと
「とにかく分かりやすく、UIデザインに拘ったデータベース」を作ろうと考えました。
また、次のウイスキーを探すという点とターゲット層から、データベースに登録するウイスキーは
できるだけ手に入りやすいウイスキーに絞ろうと考えています。

次のウイスキーを探すことの解決方法に関しては、簡単な診断機能（全5問程度でおすすめウイスキーを提示）を実装しようと考えています。
### 実装予定の機能
【MVP】
- データベース機能
  - 検索機能
    - 名前、フレーバー、飲み方などで検索ができる
  - 一覧、詳細画面
  - ウイスキー情報
    - 画像
    - 名前
    - 価格
    - フレーバー
    - テイスティングノート
    - おすすめの飲み方
    - 入手難易度
  - 飲み方
    - ハイボール
    - オンザロック
    - etc..
    - 一覧画面
      - それぞれに説明と豆知識
  - フレーバー
    - フレーバーマップ
      - ligth or rich
      - delicate or smokey
    - フレーバー
      - フルーティ
      - バニラ
      - etc..
    - 一覧画面
      - それぞれにニュアンスの説明と具体例。
  - ユーザー機能
    - CRUD
  - 投稿機能
    - CRUD
    下記情報を記録として残せる
    - 一番強く感じたフレーバー
    - 飲み方
    - 感想
【本リリース】
- 診断機能
  - 飲み口は軽い？重い？
  - 香りは繊細？芳醇？
  - どの飲み方が好き？
  - 上記のような質問から結果を提示。（診断というより、検索を質問形式にしたようなイメージ）
- デザインの洗練
- ウイスキー情報に情報を追加
  - 生産地
  - おすすめのおつまみ
  - その他Tips
  - アフェリエイトリンク
  - etc..
### なぜこのサービスを作りたいのか？
ウイスキーを買う前の情報収集において
知識が求められる事が多かったり、デザインが見にくいことが多い。
また、同世代にウイスキーが好きな人が少ない。
小難しい印象があるウイスキーを、もっと気軽に試せるきっかけを作りたいと考えたため
UIデザインに拘ったデータベースサイトを作ろうと思いました。

### スケジュール
README作成： 12/31 〆切
画面遷移図＆ER図作成： 1/13 〆切
メイン機能実装： 1/25 〆切
β版をRUNTEQ内リリース（MVP）： 1/31 〆切
本番リリース： 2/28 〆切
