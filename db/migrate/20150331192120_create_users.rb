class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ''
      t.string :display_name
      t.string :first_name
      t.string :last_name
      t.string :image
      
      t.string :provider
      t.string :uid
      t.string :token

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
