# アプリケーション名

"Recipe blog"
 料理好きのための、レシピ共有サイトです。

# アプリケーション概要
ユーザーがレシピを共有し合えるアプリを作りました。
作ったレシピを共有したり、お気に入りのレシピをまとめて整理することができます。
レシピの共有だけでなく、コメント機能を通してユーザー同士が繋がり、料理好きの仲間が増えていくことでしょう。

# 制作目的
・料理好きの人々が、レシピサイトを通して繋がれる場を増やす。
・レシピの幅を広げられるアプリを作る。

# DEMO
◎ユーザー管理機能
ユーザー登録/ログイン機能/ログアウト機能
・https://gyazo.com/2b37af0ac84a6ecf8ec1703b63d33b8d (ユーザー登録機能)
・https://gyazo.com/c718fe37e8ea8d2f5848d629a5acade9 (ログイン機能)
・https://gyazo.com/ac080b22a3fa3263a613007411683ccb (ログアウト機能)

◎レシピ投稿機能
新規投稿機能/編集機能/詳細表示機能/削除機能
・https://gyazo.com/38fadff60026ff37e912382096389607 (新規投稿機能)
・https://gyazo.com/07872c2a52a69bb1e43f53ece44d4188 (編集機能)
・https://gyazo.com/cc6d9f1f59c7995d9d679725f29bc7c5 (詳細表示機能)
・https://gyazo.com/bbbad6b3dd7f9d7d6e363b6376ad2ec9 (削除機能)

◎ユーザー詳細機能(GIF添付)
ユーザー詳細ページにて、投稿済みの記事が一覧表示できる
・https://gyazo.com/6aa8ff2740a3e28edddf713f76a4b6c2
◎コメント機能(GIF添付)
投稿詳細ページにて、ユーザは自由にコメントができる
・https://gyazo.com/7542da238e26a72525b7803068ca9743
◎カテゴリ表示機能
カテゴリ表示により、ユーザーは容易にレシピ検索ができる
・https://gyazo.com/b40c848baede9c9946918100d23dc2bd
◎キーワード検索機能
検索窓からレシピ名のキーワード検索が可能
・https://gyazo.com/6355c98bc72bc22f682be6f9dcd7ced2

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
● 新規投稿/編集 の画像投稿時、添付画像が表示されない点
画像プレビュー機能の実装 により、ユーザーの意図した画像を、確実に投稿できるように実装したいと考えております。

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

