# アプリケーション名
Emorecord

# アプリ概要
- ネガティブとポジティブの感情を記録できる。

## アプリ機能
- 記録する際に感情の強さを1~10まで選択できる。
- 複数タグを同時に登録できる。
- 記録はポジティブ/ネガティブ画面の詳細画面から確認できる。

# URL
https://emoreco-app.onrender.com

### お試し用アカウント
email: sample@sample
password: sample1

# 使い方
### 新規登録
任意のemailとpasswordを登録します。

# テーブル設計
## usersテーブル
| Culumn            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| email             | string  |  null: false,unique: true |
| encrypted_password| string  |  null: false              |


### Association
- has_many :positives
- has_many :negatives
- has_many :tags


## positivesテーブル
| Culumn            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| emotion_lv_id     | integer |  null: false              |
| positive_context  | text    |                           |
| user              |references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :emotion_lv
- has_many :tags, through: :emotion_tag_relations

## negativesテーブル
| Culumn            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| emotion_lv_id     | integer |  null: false              |
| negative_context  | text    |                           |
| user              |references| null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :emotion_lv
- has_many :tags, through: :emotion_tag_relations

## positive_tag_relationsテーブル(中間テーブル)
| Culumn            | Type       | Options                       |
| ----------------- | -------    | ----------------------------- |
| positive_id       | references | null: false,foreign_key: true |
| tag_id            | references | null: false,foreign_key: true |

### Association
- belongs_to :positive
- belongs_to :tag

## negative_tag_relationsテーブル(中間テーブル)
| Culumn            | Type       | Options                       |
| ----------------- | -------    | ----------------------------- |
| negative_id       | references | null: false,foreign_key: true |
| tag_id            | references | null: false,foreign_key: true |

### Association
- belongs_to :negative
- belongs_to :tag

## tagsテーブル
| Culumn            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| name              | string  |                           |

### Association
- belongs_to :user
- has_many :positives, through: :emotion_tag_relations
- has_many :negatives, through: :emotion_tag_relations