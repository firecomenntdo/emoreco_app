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

# 利用方法
### 新規登録
任意のemailとpasswordを登録します。
https://github.com/user-attachments/assets/6c5e67ed-6eeb-4fae-85a1-3c789cac8b83

### ポジティブとネガティブの感情を登録
* 感情Lv(1~10)(必須)
* 「あった出来事」記入(任意)
* 「タグをカンマで区切って入力」記入(任意)
https://github.com/user-attachments/assets/26e6e049-a2e8-4c4a-bdab-a60ddd77f958



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
