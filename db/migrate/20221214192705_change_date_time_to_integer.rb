class ChangeDateTimeToInteger < ActiveRecord::Migration[7.0]
  def change
    remove_column :recipes, :preparation_time
    add_column :recipes, :preparation_time, :integer

    remove_column :recipes, :cooking_time
    add_column :recipes, :cooking_time, :integer
  end
end
