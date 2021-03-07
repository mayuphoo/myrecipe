# テーブル設計

  ## usersテーブル
｜ Column     | Type   | Option      |
｜ ---------  | -----  | ----------- |
｜ email      | string | null: false |
｜ password   | string | null: false |
｜ name       | string | null: false |
 ### Association
- has_many :posts
- has_many :comments
- has_many :likes


  ## postsテーブル 
｜ Column     | Type       | Option      |
｜ ---------  | ---------  | ----------  |
｜ title      | string     | null: false |
｜ body       | text       | null: false |
｜ user       | references |             |
｜ category   | integer    | null: false |★Active

 ### Association
- belongs_to :user
- has_many :comments
- has_many :likes


  ## commentsテーブル 
｜ Column    | Type       | Option      |
｜ --------- | ---------  | ----------  |
｜ text      | text       | null: false |
｜ user      | references |             |
｜ post      | references |             |
 ### Association
- belongs_to :user
- belongs_to :post


  ## likesテーブル 
｜ Column    | Type       | Option      |
｜ --------- | ---------  | ----------  |
｜ user      | references |             |
｜ post      | references |             |
 ### Association
- belongs_to :user
- belongs_to :post

