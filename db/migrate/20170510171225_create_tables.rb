class CreateTables < ActiveRecord::Migration[5.1]
  def change
    create_table(:tags) do |t|
      t.column(:ingredient, :string)
      t.timestamps
    end

    create_table(:recipes) do |t|
      t.column(:name, :string)
      t.column(:instructions, :string)
      t.column(:category_id, :integer)
      t.column(:tag_id, :integer)
      t.timestamps
    end

    create_table(:categories) do |t|
      t.column(:title, :string)
      t.timestamps
    end
  end
end
