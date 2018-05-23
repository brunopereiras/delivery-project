class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :user_type, foreign_key: true, default: 1
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
