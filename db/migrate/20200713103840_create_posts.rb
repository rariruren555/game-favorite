class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :game_name,  null: false
      t.string :game_hard,  null: false
      t.integer :evaluation, null: false
      t.string :title,  null: false
      t.text :text,  null: false
      t.string :image
      t.timestamps
    end
    add_index :posts, :game_name
    add_index :posts, :game_hard
  end
end
