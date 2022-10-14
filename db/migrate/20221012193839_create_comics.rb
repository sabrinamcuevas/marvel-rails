class CreateComics < ActiveRecord::Migration[7.0]
  def change
    create_table :comics do |t|
      t.belongs_to :serie
      t.bigint :comic_id
      t.string :title
      t.string :description
      t.string :image_url
      t.string :isbn
      t.integer :page_count

      t.timestamps
    end
  end
end
