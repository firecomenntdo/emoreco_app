# アプリケーション名
Emorecord

# アプリ概要
- ネガティブとポジティブの感情を記録できる。

## アプリ機能
- 記録する際に感情の強さを1~10まで選択できる。
- 複数タグを同時に登録できる。
- 記録はポジティブ/ネガティブ画面の詳細画面から確認できる。


# 利用方法
### 新規登録
任意のemailとpasswordを登録します。

<img src="https://github.com/user-attachments/assets/9b98fed5-b48c-4504-b04a-5be0a4886f15" height="500px">

### ポジティブとネガティブの感情を登録
* 感情Lv(1~10)(必須)
* 「あった出来事」記入(任意)
* 「タグをカンマで区切って入力」記入(任意)

<img src="https://github.com/user-attachments/assets/31a9fda0-681c-4878-91a9-8fa4cec2c659" height="500px">


# アプリケーションを作成した背景
転職活動の自己分析をする際に、質問に答えられない事が多く、自分のことを理解していないことが分かった。感情を大きくポジティブとネガティブに分け、感情のレベルと内容をその場で登録し後で確認出来れば便利だと考え、アプリケーションを開発した。

## ER図
![emorecoER](https://github.com/user-attachments/assets/6e3864f6-b7d9-49c2-8d5f-dbea30e19ae1)

## 画面遷移図
<img width="1053" alt="emorecoseni" src="https://github.com/user-attachments/assets/dfa75ff0-de54-4c77-a05c-ca2afd274849">

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
