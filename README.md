# アプリ説明
- 選択式テストのアプリ
- メインアカとサブアカを同時に作成
- メインはリスト、問題、回答の作成・編集ができる
- サブはリストの閲覧、問題の回答ができる、編集はできない

# ER図

## usersテーブル
### main_usersテーブル

| Colum    | Type   | Option      |
| -------- | ------ | ----------- |
| name     | string | null: false |
| password | string | null: false |
| position | string | null: false |
| logo     | image  |             |

- has_one :sub_user
- has_many :topics

### sub_usersテーブル

| Colum     | Type       | Option                         |
| --------- | ---------- | ------------------------------ |
| name      | string     | null: false                    |
| password  | string     | null: false                    |
| main_user | references | null: false, foreign_key: true |

- belongs_to :main_user
- has_many :topics

## topicsテーブル

| Colum      | Type       | Option                         |
| ---------- | ---------- | ------------------------------ |
| topic_name | string     | null: false                    |
| creator    | string     | null: false                    |
| main_user  | references | null: false, foreign_key: true |
| sub_user   | references | null: false, foreign_key: true |

- belongs_to :main_user
- belongs_to :sub_user
- has_many :questions

## questionsテーブル

| Colum | Type       | Option                         |
| ----- | ---------- | ------------------------------ |
| image | image      |                                |
| text  | text       | null: false                    |
| topic | references | null: false, foreign_key: true |

- belongs_to :topic
- has_many :answers

## answersテーブル

| Colum    | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| answer   | text       | null: false                    |
| mark     | integer    | null: false                    |
| question | references | null: false, foreign_key: true |

- belongs_to :question
