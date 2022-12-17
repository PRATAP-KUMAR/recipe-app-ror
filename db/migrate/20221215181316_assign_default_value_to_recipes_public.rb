class AssignDefaultValueToRecipesPublic < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :public, :boolean, default: false
  end
end
