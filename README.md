# アプリケーション名
GAME CONNECT

# アプリケーション概要
ゲーム仲間募集をシェア、ユーザー同士のコミュニケーションを取ることでゲーム仲間を作ることができる

# URL
https://game-connect-37408.herokuapp.com/

# テスト用アカウント
- Basic認証パスワード：basic
- Basic認証ID：2222
- メールアドレス：111111@gmail.com
- パスワード：a11111

# 利用方法
## 募集投稿
1.トップページのヘッダーからユーザー新規登録を行う
2.トップページサイドバーの投稿するボタンから募集する内容（ゲームタイトル、概要）を入力し、投稿する

## ユーザー同士で交流する
1.投稿内容やプロフィールから気になるユーザーがいれば投稿へのコメント、チャットでの連絡にてコンタクトを取る

# アプリケーションを作成した背景
私が感じたことで、最近は外出も少なくなり家で趣味のゲームをする機会が増えたが、やりたいゲームがあっても人数が足りない、プレイスタイルの合う人と一緒にボイスチャットを繋げてプレイしたいけど周りには該当する人がいないという課題を感じた。課題を分析した結果、「ゲームタイトルや自分の希望とするスタイルとマッチする人を探す場がない」ということが真因であると仮説を立てた。その真因を解決するために、ゲームフレンド募集投稿を共有し、ユーザー同士がコミュニケーションを取ることでゲーマー同士のマッチングを促進できるアプリケーションを開発することにした。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1eXKCnQlPrR2En_VTSTNilo7_pdF7PdZOlsABzS0REXg/edit#gid=982722306) 

# 実装した機能についての画像やGIFおよびその説明
トップ画面：フレンド募集の投稿一覧表示とユーザー一覧表示とユーザー登録とログインを選択することができます。
[![Image from Gyazo](https://i.gyazo.com/3c274a7dfca690fb5db8eaede7704dc8.png)](https://gyazo.com/3c274a7dfca690fb5db8eaede7704dc8)

新規登録画面：ニックネーム、メールアドレス、パスワードが入力必須です。生年月日、性別、お気に入りゲームタイトル、自己紹介文は任意項目です。不備があるとエラー表示されます。
[![Image from Gyazo](https://i.gyazo.com/1f60e2ddd44cbd6a6e0772fb32106145.gif)](https://gyazo.com/1f60e2ddd44cbd6a6e0772fb32106145)

ログイン済みトップ画面：ログインするとチャットルームへのリンク出現、ログインボタンはログアウトボタンへ、新規登録ボタンはユーザー情報ボタンへ変更されます。また、ログインしているユーザーの投稿には編集と削除ボタンが出現します。
[![Image from Gyazo](https://i.gyazo.com/cf499954a06042836b6dde1db7f6de94.png)](https://gyazo.com/cf499954a06042836b6dde1db7f6de94)

ユーザー一覧ページ：ニックネーム、お気に入りゲームタイトルが表示され、クリックでそのユーザーの詳細ページへ遷移します。
[![Image from Gyazo](https://i.gyazo.com/072a6bf214cfa7bc12ca82a482fb426d.png)](https://gyazo.com/072a6bf214cfa7bc12ca82a482fb426d)

ユーザー詳細ページ：ユーザー登録の際にニックネーム、誕生日、性別、お気に入りゲームタイトル、自己紹介文が表示されます。また、ユーザー自身の場合はユーザー編集ページへのリンクが出現します。
[![Image from Gyazo](https://i.gyazo.com/9b6e9b2ef07d4d4ec68b71a5249a0a6f.png)](https://gyazo.com/9b6e9b2ef07d4d4ec68b71a5249a0a6f)

投稿ページ：プレイしたいゲームタイトル、その他どんなフレンドを探しているかを自由に募集概要に記述して投稿することができます。
[![Image from Gyazo](https://i.gyazo.com/60dd38acf33f09aa3113e3e0df5062e3.png)](https://gyazo.com/60dd38acf33f09aa3113e3e0df5062e3)

チャットページ：気になるユーザーが見つかったらチャットルームにてコンタクトを取ることができます。動画の通りにユーザー選択してルームを作成することができます。
[![Image from Gyazo](https://i.gyazo.com/ec237ce2decda522debc31ecd142335c.gif)](https://gyazo.com/ec237ce2decda522debc31ecd142335c)

チャットメッセージ：メッセージは画像の通り新しい順に表示され削除ボタンも出現します。
[![Image from Gyazo](https://i.gyazo.com/06caae06a37aedf57f9838a9d126af38.png)](https://gyazo.com/06caae06a37aedf57f9838a9d126af38)

# 実装予定の機能
現在、投稿をワード検索する機能を実装中。
今後は投稿へのコメント機能、フォロー機能、投稿のお気に入り機能、ウィザード形式でのユーザー情報とプロフィール情報の登録機能を実装予定。

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/eacac4a1af28f7cee7d91cee42d1cf83.png)](https://gyazo.com/eacac4a1af28f7cee7d91cee42d1cf83)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/3ad194441fe75633993e89830b85e40d.png)](https://gyazo.com/3ad194441fe75633993e89830b85e40d)

# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行
% git clone https://github.com/kouki135/game_connect
% cd game game_connect
% bundle install
% yarn install

# 工夫したポイント
- どのページからでもトップバーから主要なページにワンクリックで遷移できるようにした
- コミュニケーションをとりやすくするために投稿へのコメント機能（実装予定）とチャットという２通りのメッセージ機能を実装する予定
- チャットページではルーム名に選択した相手のニックネーム表示をすることで見分けやすくした

<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| gender              | string  |                           |
| favorite_game_title | text    |                           |
| self_introduction   | string  |                           |
| birthday            | date    |                           |

### Association

- has_many :recruitments
- has_many :comments
- has_many :favorites
- has_many :favorite_recruitments, through: :favorites, source: :recruitment
- has_many :messages
- has_many :user_rooms
- has_many :rooms, through: :user_rooms

## recruitments テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| game_title        | string     | null: false                    |
| title             | string     | null: false                    |
| user              | references | null: false, foreign_key: true |
| favorite          | references | null: false, foreign_key: true |

### Association

- has_many :comments
- belongs_to :user
- belongs_to :favorite

## favorites テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| recruitment   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recruitment

## comments テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| text        | string     | null: false                    |
| user        | references | null: false, foreign_key: true |
| recruitment | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :recruitment

## relationship テーブル

| Column    | Type       | Options                                   |
| --------- | ---------- | ----------------------------------------- |
| user_id   | references | foreign_key: true                         |
| follow_id | references | follow, foreign_key: { to_table: :users } |

### Association

- belongs_to :following, class_name: "User"
- belongs_to :follower, class_name: "User"

## rooms テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user