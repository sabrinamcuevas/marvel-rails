class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.belongs_to :comic
      t.bigint :character_id
      t.string :name
      t.text :description
      t.string :image_url
      t.string :extension

      t.timestamps
    end
  end
end
