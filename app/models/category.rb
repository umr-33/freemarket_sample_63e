class Category < ApplicationRecord
  has_ancestry
  has_many :items
  def self.get_root_category
    Category.find(1)
  end
end
