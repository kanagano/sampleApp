class ChangeDatatypeStarOfPosts < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :star, :integer
  end
end
