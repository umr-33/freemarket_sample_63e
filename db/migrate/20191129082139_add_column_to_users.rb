class AddColumnToUsers < ActiveRecord::Migration[5.0]
  change_table :users do |t|
    t.string :nickname
    t.string :first_name
    t.string :family_name
    t.string :first_name_kana
    t.string :family_name_kana

    t.integer :birth_year
    t.integer :birth_month
    t.integer :birth_date
  end
end
