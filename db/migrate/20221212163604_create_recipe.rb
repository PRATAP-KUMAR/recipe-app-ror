class CreateRecipe < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.datetime :preparation_time
      t.datetime :cooking_time
      t.text :description
      t.boolean :public

      t.timestamps
    end
  end
end
