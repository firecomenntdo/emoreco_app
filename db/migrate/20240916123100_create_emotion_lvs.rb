class CreateEmotionLvs < ActiveRecord::Migration[7.0]
  def change
    create_table :emotion_lvs do |t|
      t.integer :level

      t.timestamps
    end
  end
end
