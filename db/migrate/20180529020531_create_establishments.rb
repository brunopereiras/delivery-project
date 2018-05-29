class CreateEstablishments < ActiveRecord::Migration[5.1]
  def change
    create_table :establishments do |t|
      t.references :user, foreign_key: true
      t.string :name
      t.string :link_name

      t.timestamps
    end
  end
end
