class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :user, foreign_key: true
      t.string :title
      t.string :subtitle
      t.text :body
      t.string :title_color
      t.string :body_color

      t.timestamps null: false
    end
  end
end
