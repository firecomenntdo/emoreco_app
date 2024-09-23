class CreateNegativeTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :negative_tag_relations do |t|
      t.references :negative, null:false, forein_key: true
      t.references :tag, null:false, forein_key: true

      t.timestamps
    end
  end
end
