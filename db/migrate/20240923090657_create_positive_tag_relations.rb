class CreatePositiveTagRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :positive_tag_relations do |t|
      t.references :positive, null: false,foreign_key: true
      t.references :tag, null: false,foreign_key: true

      t.timestamps
    end
  end
end
