# README

## URL
http://18.178.18.18/

## tweet_by_salonとは？
オンラインサロン内で4名の有志による共同開発をしようという取り組みです。<br>

## tweetとは？
・tweetできるCRUD開発アプリ<br>
・tag機能によりジャンル別にフィルタリングが可能<br>
・comment機能によりユーザー間コミュニケーションが可能<br>

## Requirement
・ruby ：2.5.1<br>
・rails：5.2.3<br>

## Author
Tatsuaki、まっすー、ハリソン、Masa、しゅん

## E-R図
<img width="600" alt="tweet" src="https://gyazo.com/fba5cb570fb4e328ea5fee6acf5d7d53.png">

## Userテーブル
|カラム名|タイプ|オプション|
|--|--|--|
| name      | string | null: false |
| email     | string | null: false, unique: true |
| password  | string | null: false |
| nickname  | string | null: false, unique: true |

### Association
- has_many : tweet
- has_many : comment

---
## Tweetテーブル
|カラム名|タイプ|オプション|
|--|--|--|
| title   | string | null: false |
| content | text   | null: false |
| image   | string |
| user_id | references | null: false, foreign_key: true |

### Association
- has_one : tag
- belongs_to :user

---
## Commentテーブル
|カラム名|タイプ|オプション|
|--|--|--|
| content  | string | null: false |
| user_id  | references | null: false, foreign_key: true |
| tweet_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :tweet

---
## Tagテーブル
|カラム名|タイプ|オプション|
|--|--|--|
| tag  | string | null: false |
| tweet_id | references | null: false, foreign_key: true |

### Association
- belongs_to :tweet