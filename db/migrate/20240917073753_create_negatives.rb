class CreateNegatives < ActiveRecord::Migration[7.0]
  def change
    create_table :negatives do |t|
      t.integer :emotion_lv_id,         null:false
      t.text    :negative_context
      t.integer :tag_id
      t.references :user,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
