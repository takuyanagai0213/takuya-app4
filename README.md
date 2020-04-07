## 概要

FishingShares は釣りの画像や釣行レポートを共有することができるSNSサービスです。

## リンク
https://fishingshares.com/

## 何ができるのか？（機能）
FishingShares は、以下のことができます。
<br>→既存のサービスで実装されていない機能には⭐️を付けています。

- ユーザの登録
- ユーザプロフィールの編集
- 記事の投稿/編集/削除
- 記事に表紙となる画像を添付して、投稿ができる
- 記事に複数の詳細画像を添付することができる。
- ⭐️記事の詳細ページで、釣れた場所（GoogleMapにて）を確認できる
- ⭐️記事にコメントをする
- ⭐️記事をブックマーク（お気に入りに追加）する

## どのように作られているか？（技術）
FishingShares は、以下の技術を使用しています。
<br>→開発現場での実際の業務を想定して使用技術を選定しております。

- Rails
- docker（開発環境に導入）
- AWS EC2インスタンスでデプロイ
　<br>→Webサーバにnginx、アプリケーションサーバにunicornを使用
- AWS S3
- GoogleMap API
- MySQL
- RSpec
- CircleCI
- Capistrano
- Terraform

## インフラ構成図
<img width="764" alt="06ac65cca9b02b77dee6909fe0a25bed" src="https://user-images.githubusercontent.com/59494906/78553012-80f67980-7843-11ea-8fdf-bbaca4d3c6d6.png">

