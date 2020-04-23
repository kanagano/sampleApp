class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :museum_id
      t.text :content

      t.timestamps
    end
  end
end
