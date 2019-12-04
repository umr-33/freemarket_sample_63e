crumb :root do
  link "メルカリ", root_path
end

crumb :users do
  link "マイページ", users_path
  parent :root
end

crumb :profile do
  link "プロフィール", profile_user_path
  parent :users
end

crumb :listing do
  link "出品した商品-出品中", listing_user_path
  parent :users
end

crumb :logout do
  link "ログアウト", logout_users_path
  parent :users
end

crumb :payment do
  link "支払い方法", payment_users_path
  parent :users
end

crumb :identification_users do
  link "本人情報の登録", identification_users_path
  parent :users
end

crumb :edit do
  link "出品した商品", edit_item_path
  parent :users
end

crumb :brands do
  link "ブランド一覧", brand_path
  parent :root
end



# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).