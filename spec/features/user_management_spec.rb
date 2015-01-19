require 'spec_helper'
require_relative 'helpers/sessions'

include SessionsHelper

feature 'user signs up' do

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

feature "user logs out" do

  before(:each) do
    User.create(name: 'Matteo',
                username: 'matteomanzo',
                email: 'matteo@gmail.com',
                password: '1234',
                password_confirmation: '1234')
  end

  scenario "while being signed out" do
    log_in('matteomanzo', '1234')
    click_button 'Log out'
    expect(page).to have_content('Good bye!')
    expect(page).not_to have_content('Welcome, matteomanzo')
  end
end