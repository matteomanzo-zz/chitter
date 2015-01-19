require 'spec_helper'

feature 'user signs up' do

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

  scenario "when being a new maker user visiting the site" do
    expect{sign_up}.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, matteomanzo")
    expect(User.first.email).to eq("maker@example.com")
  end


  scenario "with a password that doesn't match" do
    expect{ sign_up('Matteo Manzo', 'matteomanzo', 'maker@example.com' 'pass', 'wrong') }.to change(User, :count).by(0)
    expect(current_path).to eq('/users')
    expect(page).to have_content("Password does not match the confirmation")
  end

  scenario 'with an email that is already registered' do
    expect { sign_up }.to change(User, :count).by 1
    expect { sign_up }.to change(User, :count).by 0
    expect(page).to have_content("This email is already taken")
  end

  scenario 'with a username that is already registered' do
    expect { sign_up }.to change(User, :count).by 1
    expect { sign_up }.to change(User, :count).by 0
    expect(page).to have_content("This username is already taken")
  end
end

feature 'user logs in' do 

  before(:each) do
    User.create(name: 'Matteo',
                username: 'matteomanzo',
                email: 'matteo@gmail.com',
                password: '1234',
                password_confirmation: '1234')
  end

  def log_in(username, password)
    visit '/sessions/new'
    fill_in 'username', with: username
    fill_in 'password', with: password
    click_button 'Log in'
  end

  scenario "with correct credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, matteomanzo")
    log_in('matteomanzo', '1234')
    expect(page).to have_content("Welcome, matteomanzo")
  end

  scenario "with incorrect credentials" do
    visit '/'
    expect(page).not_to have_content("Welcome, matteomanzo")
    log_in('matteomanzo', '1234')
    expect(page).to have_content("Welcome, matteomanzo")
  end

end