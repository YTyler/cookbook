class JoinIngredientsAndRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients_recipes, id: false do |t|
      t.belongs_to :recipe, index: true
      t.belongs_to :ingredient, index: true
    end
  end
end
