class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :admin, default: false
      t.string :remember_digest
      t.string :password_digest

      t.timestamps null: false
    end
  end
end
