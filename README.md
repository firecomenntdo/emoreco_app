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
- belongs_to :emotion_lv
- has_many :tags, through: :emotion_tag_relations

## negativesテーブル
| Culumn            | Type    | Options                   |
| ----------------- | ------- | ------------------------- |
| emotion_lv_id     | integer |  null: false              |
| negative_context  | text    |                           |
| tag_id            | integer |                           |
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