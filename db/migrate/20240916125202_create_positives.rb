class CreatePositives < ActiveRecord::Migration[7.0]
  def change
    create_table :positives do |t|
      t.integer :emotion_lv_id,         null:false
      t.text    :positive_context
      t.integer :tag_id

      t.timestamps
    end
  end
end
