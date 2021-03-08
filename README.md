# アプリケーション名

"My recipe"
 料理好きのための、レシピ共有サイトです。

# アプリケーション概要
ユーザーがレシピを共有し合えるアプリを作りました。
作ったレシピを共有したり、お気に入りのレシピをまとめて整理することができます。
レシピの共有だけでなく、コメント機能を通してユーザー同士が繋がり、料理好きの仲間が増えていくことでしょう。

# 制作目的
・料理好きの人々が、レシピサイトを通して繋がれる場を増やす目的。
・レシピの幅を広げられるアプリを作る目的。

# DEMO
◎ユーザー管理機能(GIF添付)
ユーザー登録/ログイン機能/ログアウト機能

◎レシピ投稿機能(GIF添付)
新規投稿機能/編集機能/削除機能/詳細表示機能

◎ユーザー詳細機能(GIF添付)
ユーザー詳細ページにて、投稿済みの記事が一覧表示できる

◎コメント機能(GIF添付)
投稿詳細ページにて、ユーザは自由にコメントができる

# 本番環境URL
https://myrecipe30336.herokuapp.com/

# テスト用アカウント
アカウント①
email : aaa@aaa
password : aaa123

アカウント②
email : bbb@bbb
password : bbb123


# 工夫したポイント
ユーザー同士コミュニケーションが取れる、コメント機能を実装した点です。
レシピ投稿だけではなく、同じ目的を持った仲間との交流ができることで、アプリ利用のリピート率上昇も期待できます。
また、全体的にシンプルな見た目・構造に仕上げることにより、使いやすさを重視しています。

# 開発環境
- Ruby on Rails 6.0.3.5  (Ruby本体)
- Bundler                (RubyGem管理ツール)
- MySQL                  (データベース)
- Visual Studio Code     (テキストエディタ)
- Github/Github Desktop  (コード管理)
- rubocop-auto-correct   (コード整形ツール)

# 課題・実装予定機能
・課題
①求めているレシピがある場合、レシピ一覧ページからだとすぐに見つけづらい点。
：カテゴリ表示機能の実装 により、ユーザーのレシピ検索を容易にしたいと考えております。

②お気に入りのレシピを保存できる機能がない点。
：いいね機能の実装 により、いいねした他ユーザーの投稿を、ユーザー詳細ページから一覧表示できる機能を追加したいと考えております。

③新規投稿/編集 の画像投稿時、添付画像が表示されない点。
画像プレビュー機能の実装 により、ユーザーの意図した画像を、確実に投稿できるようにしたいと考えております。

# DB設計
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
｜ Column     | Type       | Option            |
｜ ---------  | ---------  | ----------        |
｜ title      | string     | null: false       |
｜ body       | text       | null: false       |
｜ user       | references | foreign_key: true |
｜ category   | integer    | null: false       | ★Active

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

