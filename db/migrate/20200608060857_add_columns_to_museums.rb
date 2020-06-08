class AddColumnsToMuseums < ActiveRecord::Migration[5.2]
  def change
    add_column :museums, :opening_time, :string
    add_column :museums, :closing_day, :string
  end
end
