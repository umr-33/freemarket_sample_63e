class Brand < ApplicationRecord
  has_ancestry
  
  def abc_sort(brand_cat)
    children = brand_cat.children.sort{|a,b| a.name <=> b.name}
    
    topchar = children[0].name[0]
    abclist = []
    common_initial_brands = []
    children.each do |c|
      if c.name[0] == topchar
        common_initial_brands << c
      else
        abclist << [topchar ,common_initial_brands]
        common_initial_brands = []
        # topcharとその配列をセットし直す
        topchar = c.name[0]
        common_initial_brands << c
      end
    end
    return abclist
  end

end
