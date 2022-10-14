class CreateCreators < ActiveRecord::Migration[7.0]
  def change
    create_table :creators do |t|
      t.bigint :creator_id
      t.string :first_name
      t.string :last_name
      t.string :image_url

      t.timestamps
    end
  end
end
