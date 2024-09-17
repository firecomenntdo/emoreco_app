class CreatePositives < ActiveRecord::Migration[7.0]
  def change
    create_table :positives do |t|
      t.integer :emotion_lv_id,         null:false
      t.text    :positive_context
      t.integer :tag_id
      t.references :user,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
