require 'spec_helper'

feature "User adds a new post" do
  scenario "When I am on the home page" do 
    expect(Post.count).to eq 0
    visit '/'
    add_post('Happy new year Makers!! Starting a very good year with databases.')
    expect(Post.count).to eq 1
    post = Post.first
    expect(post.message).to have_content('databases')
  end

  def add_post(message)
    within('#new-post') do
      fill_in 'message', with: message
      click_button('Post message!')
    end
  end
end