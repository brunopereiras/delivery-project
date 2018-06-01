class CreateProductCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :product_categories do |t|
      t.references :establishment, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
