class ChangeIndexOnTags < ActiveRecord::Migration[7.0]
  def change
        # 既存のユニークインデックスを削除
        remove_index :tags, :name, if_exists: true

        # 新しいユニークインデックスを追加
        add_index :tags, [:name, :user_id], unique: true
  end
end
