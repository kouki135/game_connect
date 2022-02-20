# README
# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| gender_id           | integer | null: false               |
| favorite_game_title | text    | null: false               |
| self_introduction   | string  | null: false               |
| birthday            | date    |                           |

### Association

- has_many :recruitments
- has_many :comments
- has_many :favorites
- has_many :favorite_recruitments, through: :favorites, source: :recruitment
- has_many :messages
- has_many :user_rooms
- has_many :rooms, through: :user_rooms
# ====================自分がフォローしているユーザーとの関連 ===================================
# フォローする側のUserから見て、フォローされる側のUserを(中間テーブルを介して)集める。なので親はfollowing_id(フォローする側)
- has_many :active_relationships, class_name: "Relationship", foreign_key: :following_id
# 中間テーブルを介して「follower」モデルのUser(フォローされた側)を集めることを「followings」と定義
- has_many :followings, through: :active_relationships, source: :follower
# ========================================================================================

# ====================自分がフォローされるユーザーとの関連 ===================================
# フォローされる側のUserから見て、フォローしてくる側のUserを(中間テーブルを介して)集める。なので親はfollower_id(フォローされる側)
- has_many :passive_relationships, class_name: "Relationship", foreign_key: :follower_id
# 中間テーブルを介して「following」モデルのUser(フォローする側)を集めることを「followers」と定義
- has_many :followers, through: :passive_relationships, source: :following
# =====================================================================================

## recruitments テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| game_title        | string     | null: false                    |
| recruitment_title | string     | null: false                    |
| content           | text       | null: false                    |
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

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| following | string     | null: false                    |
| follower  | references | null: false, foreign_key: true |

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
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user