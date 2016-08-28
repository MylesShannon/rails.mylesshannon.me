class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, index: true
      t.string :title
      t.string :subtitle
      t.text :body
      t.string :title_color
      t.string :body_color

      t.timestamps null: false
    end
    add_foreign_key :notes, :users
  end
end
