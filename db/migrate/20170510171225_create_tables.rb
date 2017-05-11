class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:categories) do |t|
      t.column(:title, :string)
      t.timestamps
    end

    create_table(:categories_recipes) do |t|
      t.column(:category_id, :integer)
      t.column(:recipe_id, :integer)
      t.timestamps
    end

    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:ingredients, :string)
      t.column(:instructions, :string)
      t.timestamps
    end
  end
end
