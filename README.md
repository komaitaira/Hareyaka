# Hareyaka
<img width="850" alt="screenshot1" src="https://user-images.githubusercontent.com/63830279/93308629-7a7e1c00-f83d-11ea-8869-00167af8b8a1.png">

## URL
https://hareyaka.work

## サイト概要
<img width="600" alt="スクリーンショット 2020-09-17 1 00 58" src="https://user-images.githubusercontent.com/63830279/93362932-8e4b7180-f881-11ea-9bb1-693ce0500814.png">
<br>
①法人会員が投稿した記事を個人会員が閲覧することができる。<br>
  = 記事投稿を法人のみに限定することで投稿記事の信頼性の向上<br>
②気になった記事の内容や、悩みについて法人へ連絡し話を聞ける(DM機能)。<br>
  = 【個人のメリット：悩みの解決。わざわざ出向かなくても良い】<br>
  = 【法人のメリット：企業にとっての顧客になる。CSVエクスポートで営業リストとして保存可能】 <br>
③気に入った記事はお気に入りして後から見返す事ができる。<br>
  = マイページにお気に入り記事のジャンル割合を表示(chartkickを使用)。自分では気づかなかった悩みの種かもしれないもの(割合が多いもの)を可視化してくれて、よりその人の悩み解決につなげることができる。<br>

## サイトテーマ
イメージは「プロ限定知恵袋」。悩みを持つ人とそれを解決するプロをつなげるサービス。

### テーマを選んだ理由
私は前職が銀行員で主に個人への金融商品の販売に携わっていました。<br>
2018年に話題になった年金2000万円問題を始め、将来へのお金の不安は働き盛りの方や若年層は特に持っていらっしゃると思うのですが、私はその不安の解消のために必要なこととして、これからの時代は資産運用が非常に大切になってくると思っております。もっと多くの方にとって資産運用を分かりやすく身近なものにしたいと考えた事がきっかけで、お金だけでなく大小はあれども何かしらの悩みを抱えている世の中の多くの人々の助けになるようなサービスがあれば、より多くの人がもっと人生を楽しむことができると思い、このテーマにしました。

### ターゲットユーザ
悩みを持つ幅広い年齢層

### 主な利用シーン
身近な人にはあまり言いたくないような悩み（健康、美容、お金、恋愛、etc.）を持つ方、悩みはあるけどわざわざ外に出向いていくほどでもない（銀行に話を聞きにいく等）と思っている方が、インターネット上で気軽に情報を手に入れられたり、その道のプロに話を聞きたい時に利用する。

### 機能一覧
<機能例><br>
①法人は登録申請後、管理者が申請承認することでログイン可能(ActionMailerを使用)
<img width="850" alt="スクリーンショット 2020-09-17 1 01 29" src="https://user-images.githubusercontent.com/63830279/93362967-973c4300-f881-11ea-9007-d6e428f24068.png">

②お気に入り記事のジャンル割合を表示（左） = 悩みのジャンルの可視化<br>
③フォロワーのCSVエクスポート機能(右) = 顧客リストとして保存<br>
<img width="850" alt="スクリーンショット 2020-09-17 0 21 17" src="https://user-images.githubusercontent.com/63830279/93363074-b76c0200-f881-11ea-94d8-046086ab0c7c.png">

④summernoteを使用しユーザーが見やすい見た目に<br>
※記事内容は全て自分の経験や考え、あるいは完全な妄想で記載しましたので是非ご覧下さい。<br>
<img width="850" alt="スクリーンショット 2020-09-17 1 02 04" src="https://user-images.githubusercontent.com/63830279/93362986-9c998d80-f881-11ea-8948-d1cba558328a.png">

以下リンクに上記以外の機能を記載しております<br>
https://docs.google.com/spreadsheets/d/1W4wlZuPI5ALpAkt4EvuLftHnyrNGN6Zlgp-5mHSqcrw/edit?usp=sharing

## 設計書
<img width="848" alt="スクリーンショット 2020-09-17 1 21 56" src="https://user-images.githubusercontent.com/63830279/93365713-1b43fa00-f885-11ea-98d5-87fd858dfbae.png">
<br>
インフラ設計書：https://app.diagrams.net/#G1pRD-1jfVz9ZsUvG8oLvqNJKymK8oZC4m <br>
ER図：https://app.diagrams.net/#G1Bpz4NuuUMQFlHKxPN-DPr6uCSm5QFzgW <br>

### 環境・使用技術
* Ruby 2.5.7
* Rails 5.2.4.3
* MySQL2
* AWS(EC2、RDS for MySQL、Route53、CloudWatch、S3、Lambda)
* Nginx、Puma

