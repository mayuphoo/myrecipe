# アプリケーション名

"Recipe blog"
 料理好きのための、レシピ共有サイトです。

# アプリケーション概要
ユーザーがレシピを共有し合えるアプリを作りました。  
作ったレシピを共有したり、お気に入りのレシピをまとめて整理することができます。  
レシピの共有だけでなく、コメント機能を通してユーザー同士が繋がり、料理好きの仲間が増えていくことでしょう。

# 制作目的
・料理好きの人々が、レシピサイトを通して繋がれる場を増やすこと。  
・レシピの幅が広がるアプリを作ること。

# DEMO
◎ ユーザー管理機能  
ユーザー登録/ログイン機能/ログアウト機能  
https://gyazo.com/9eb24cf2e3713a38bd2f59b1ca687fd1 (ユーザー登録機能)  
https://gyazo.com/52d997d6ee3d525a67b717f5405ed77e (ログイン機能)  
https://gyazo.com/be7d1dbe455b8fcd819e36960d3f9d76 (ログアウト機能)

◎ レシピ投稿機能  
新規投稿機能/編集機能/詳細表示機能/削除機能  
https://gyazo.com/5e6777d7da5af863d60df285a29ad576 (新規投稿機能)  
https://gyazo.com/4994afc88537b56a01b9cdd108db606e (詳細表示機能)  
https://gyazo.com/f60fca36a2f65d2d5448ea7126711dc5 (編集機能)  
https://gyazo.com/fcb232469ec0d6d042fcce49e182b07c (削除機能)

◎ ユーザー詳細機能  
ユーザー詳細ページにて、投稿済みの記事が一覧表示できる  
https://gyazo.com/1a535dd9bdd80c84491f7c5e4dfd2422

◎ コメント機能  
投稿詳細ページにて、ユーザは自由にコメントができる  
https://gyazo.com/34353d35be79b22e23e202a6dd9201e4 (コメント投稿機能)  
https://gyazo.com/22ac664076e98e2a06526bbce9d3bc22（コメント削除機能）

◎ カテゴリ表示機能  
カテゴリ表示により、ユーザーは容易にレシピ検索ができる  
https://gyazo.com/4aa52186bec0312d1562fc387723745e

◎ キーワード検索機能  
検索窓からレシピ名のキーワード検索が可能  
https://gyazo.com/ca6269ce94505a464c10b3ac858d31e9

◎ いいね！機能  
お気に入りの投稿をマイページに保存して、いつでも見返すことができる  
https://gyazo.com/ab681e096c2237139eb01a334ae71291

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
- 課題  
→ 課題としては、新規投稿/編集 の画像投稿時に、添付画像が表示されないことが挙げられます。  
今後、画像プレビュー機能の実装 により、ユーザーの意図した画像を、確実に投稿できるように実装したいと考えております。

# DB設計
  ## usersテーブル
|Column|Type|Option|  
|---------|-----|-----------|
|email|string|null: false|
|password|string|null: false|
|name|string|null: false|
 ### Association
- has_many :posts
- has_many :comments
- has_many :likes


  ## postsテーブル 
 Column     | Type       | Option            |
 ---------  | ---------  | ----------        |
| title      | string     | null: false       |
| body       | text       | null: false       |
| user       | references | foreign_key: true |
| category   | integer    | null: false       | ★Active-hash

 ### Association
- belongs_to :user
- has_many :comments
- has_many :likes


  ## commentsテーブル 
 Column    | Type       | Option      |
 --------- | ---------  | ----------  |
| text      | text       | null: false |
| user      | references |             |
| post      | references |             |
 ### Association
- belongs_to :user
- belongs_to :post


  ## likesテーブル 
| Column    | Type       | Option      |
| --------- | ---------  | ----------  |
| user      | references |             |
| post      | references |             |
 ### Association
- belongs_to :user
- belongs_to :post

