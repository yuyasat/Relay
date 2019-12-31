require 'rails_helper'

RSpec.describe 'create user' do
  scenario 'ユーザー作成、ログアウト、ログイン' do
    visit signup_path

    current_time_to_i = Time.current.to_i
    nickname = "nickname#{current_time_to_i}"
    fill_in 'user[nickname]', with: nickname
    email = "test+#{current_time_to_i}@example.com"
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: 'P@ssw0rd'
    fill_in 'user[password_confirmation]', with: 'P@ssw0rd'

    click_button '登録する'

    expect(page).to have_current_path root_path
    expect(page).to have_content "#{nickname}でログイン中"

    click_link 'ログアウト'
    expect(page).to have_current_path root_path
    expect(page).to have_content 'ログイン'
    expect(page).not_to have_content "#{nickname}でログイン中"

    click_link 'ログイン'

    expect(page).to have_current_path login_path
    fill_in 'email', with: email
    fill_in 'password', with: 'P@ssw0rd'

    click_button 'ログインする'

    expect(page).to have_current_path root_path
    expect(page).to have_content "#{nickname}でログイン中"

    user = User.find_by(email: email)
    expect(user).to be_present
  end
end
