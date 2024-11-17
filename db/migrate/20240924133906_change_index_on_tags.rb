class ChangeIndexOnTags < ActiveRecord::Migration[7.0]
  def change
        # 既存のユニークインデックスを削除
        remove_index :tags, :name, if_exists: true

        # 新しいユニークインデックスを追加
        add_index :tags, [:name, :user_id], unique: true
  end
end

### add_indexは指定したテーブルにインデックスを追加する
### create_tags.rbでadd_index :tags, :name, unique: trueで同じタグは登録できないようになっている。
# なので違うユーザーが同名のタグを登録できない。
### このマイグレーションファイルで既存の:tagsが存在している場合削除し、add_indexで新しくtagを追加している