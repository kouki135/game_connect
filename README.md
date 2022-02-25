# README
# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| gender_id           | integer |                           |
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