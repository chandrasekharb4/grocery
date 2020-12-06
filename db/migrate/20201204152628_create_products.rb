class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.decimal :price
      t.string :image_url
      t.integer :category

      t.timestamps
    end
  end
end
