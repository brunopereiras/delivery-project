class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.references :product_category, foreign_key: true
      t.string :name
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
