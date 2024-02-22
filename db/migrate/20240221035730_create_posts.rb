class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.references :user,               null: false, foreign_key: true
      t.string :title,                  null: false
      t.text :text,                     null: false
      t.integer :category_id,           null: false
      t.integer :place_id,              null: false
      t.date :target_date,              null: false
      t.timestamps
    end
  end
end
