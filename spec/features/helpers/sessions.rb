module SessionsHelper

  def sign_up(name = 'Matteo Manzo',
            username = 'matteomanzo',
            email = "maker@example.com",
            password = "ruby",
            password_confirmation = 'ruby')
    visit '/users/new'
    expect(page.status_code).to eq(200)
    fill_in :name, with: name
    fill_in :username, with: username
    fill_in :email, with: email
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button "Sign up"
  end

  def log_in(username, password)
    visit '/sessions/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Log in'
  end
end