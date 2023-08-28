# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## usersテーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| name               | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| last_name_ch       | string | null: false                |
| first_name_ch      | string | null: false                |
| last_name          | string | null: false                |
| date_of_birth      | string | null: false                |

### Association

- has_many :items
- hes_many :purchases


## itemsテーブル

| Column          | Type       | Options                        |
| ----------------| ---------- | ------------------------------ |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| text            | string     | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| last_name       | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| area            | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column      | Type       | Options                       |
| ----------- | ---------- | ----------------------------- |
| item        | references | null:false, foreign_key: true |
| user        | references | null:false, foreign_key: true |
| information | references | null:false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :information


## informationsテーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| post_code        | string     | null: false |
| prefectures      | string     | null: false |
| municipalities   | string     | null: false |
| street_address   | string     | null: false |
| building_name    | string     | null: false |
| telephone_number | string     | null: false |
| purchases        | references | null: false |


### Association

- belongs_to :purchases
