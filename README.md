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
| tag_id            | integer |                           |
| user              |references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :tags

## negativesテーブル
| Culumn            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| emotion_lv_id     | integer |  null: false              |
| negative_context  | text    |                           |
| tag_id            | integer |                           |
| user              |references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :tags

## tagsテーブル
| Culumn            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| name              | string  | null: false               |

### Association
- belongs_to :user
- has_many :positives
- has_many :negatives