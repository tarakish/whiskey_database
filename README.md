![タイトル](https://user-images.githubusercontent.com/71510236/177376048-8fa6c030-fc4e-469e-aa34-1963c14ce8b2.png)


#### 「飲み方やおつまみとの相性、フレーバーや口当たりの強さ、香りの繊細さなど
#### 独自の検索軸からウイスキーを探せる情報サービス」

##### サービスURL : https://malt-mate.jp
---
![Ruby](https://img.shields.io/badge/Ruby-v3.0.1-red) ![rails](https://img.shields.io/badge/Rails-v6.1.4-red) ![semantic UI](https://img.shields.io/badge/semantic%20UI-2.4.4.0-green)

### 👥メインのターゲットユーザー
- ウイスキーが気になり始めた人。
- 興味を持ちつつも「なんか難しそう」なイメージから手を出せていないウイスキー初心者。

<br>

### 💭ユーザーの課題
既存サービスだと情報が多すぎたり、ある程度の知識が前提にされていたりと、初心者には分かりくく感じる事が多い。

結果的によく分からず、興味を失ってしまう原因にもなる。

<br>

### 💡解決方法
- より身近な要素（飲み方やおつまみなど）を検索の軸にすること。

- 表示する情報を制限し、その上で表示する情報に関してはできる限り直感的にすること。（口当たりや香りの強さなど）

この工夫により「圧倒的にわかりやすくウイスキーを探せるサービス」を提供することで

次に飲むウイスキーを選ぶ際やバーに行く前の予習として、ウイスキー選びをサポートします。

また、見た目を整えることで、認知容量を拡張→滞在時間増加→単純接触の増加で興味を持続させる狙いもあります。

<br>

### ❤️‍🔥サービス作成の背景
自分自身もウイスキー初心者で、次に買うウイスキーを調べる際はもちろん

初心者のうちは自分の好みなども確立してないので、指標として

「このウイスキーを美味しく飲めるのってどの飲み方なんだろう？」「もっと合うおつまみがあるはずだ」と思って調べた際に

情報がまとまっていなかったり、そもそも良くわからない単語が出てきたりして不便に感じる事が多かったため。

<br>

---
### 使用技術
##### フロントエンド
- html/scss/vanila JS
- CSS frame-work
  - Bootstrap
  - Semantic UI

##### バックエンド
- Ruby 3.0.1
- Rails 6.1.4
  <details>
  <summary>主要なgem</summary>
  
  ・認証　→　[Sorcery](https://github.com/Sorcery/sorcery)
  
  ・認可　→　[Pundit](https://github.com/varvet/pundit)
  
  ・検索機能　→　[Ransack](https://github.com/activerecord-hackery/ransack) / [RansackEnum](https://github.com/shoma07/ransack-enum)
  
  ・ファイルアップロード　→　[CarrierWave](https://github.com/carrierwaveuploader/carrierwave) / [Fog AWS](https://github.com/fog/fog-aws)
  
  ・ページネーション　→　[Pagy](https://github.com/ddnexus/pagy)
  
  ・静的解析ツール　→　[RuboCop](https://github.com/rubocop/rubocop)
  </details>　

##### インフラ
- heroku
- PostgreSQL
- Amazon S3　

### 画面遷移図
[figma](https://www.figma.com/file/BU2M2V8YP45y8itqZujmw2/whiskey_database?node-id=0%3A1)

### テーブル設計
![erd](https://user-images.githubusercontent.com/71510236/177377219-400aa3b4-bf44-4366-af2a-fd256b6244f6.png)

### 関連リンク
- [[Qiita]【個人開発】飲み方やおつまみの相性から直感的にウイスキーを探せるサービスを作った話🥃](https://qiita.com/tarakish/items/cfc3c5a1ae05e2a46cbe)
- Twitter
  - [公式アカウント](https://twitter.com/malt_mate)
  - [開発者](https://twitter.com/tarakish_23)

