class AddColmnToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :items_size, :integer
  end
end
