class CreateNegatives < ActiveRecord::Migration[7.0]
  def change
    create_table :negatives do |t|
      t.references :emotion_lv,         null:false,foreign_key: true
      t.text    :negative_context
      t.references :user,              null: false, foreign_key: true

      t.timestamps
    end
  end
end
