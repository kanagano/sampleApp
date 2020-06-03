class AddImageNameToMuseums < ActiveRecord::Migration[5.2]
  def change
    add_column :museums, :image_name, :string
  end
end
