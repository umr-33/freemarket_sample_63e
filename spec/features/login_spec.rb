require 'rails_helper'

feature 'login', type: :feature do
  let(:user) { create(:user) }
  
  scenario 'get item' do
    # ログイン前には投稿ボタンがない
    #expect(page).to have_no_content('投稿する')

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq root_path
    
  end
end