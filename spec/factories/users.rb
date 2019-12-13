FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

  factory :category0 do
    name {"root_cat"}
  end
  factory :category1 do
    name {"レディース"}
    parent_id {1}
  end
  factory :category2 do
    name {"トップス"}
    parent_id {2}
  end
  factory :category3 do
    name {"セーター"}
    parent_id {3}
  end

end