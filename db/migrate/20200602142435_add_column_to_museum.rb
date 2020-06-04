class AddColumnToMuseum < ActiveRecord::Migration[5.2]
  def change
    add_column :museums, :introduction, :text
  end
end
