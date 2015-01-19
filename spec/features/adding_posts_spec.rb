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

  scenario "with tags" do
    visit '/'
    add_post('Let\'s do some pairing!', ['Makers','Ping-Pong pairing'])
    post = Post.first
    expect(post.message).to eq('Let\'s do some pairing!')
    expect(post.tags.map(&:text)).to include('Makers')
    expect(post.tags.map(&:text)).to include('Ping-Pong pairing')
  end

  def add_post(message, tags = [])
    within('#new-post') do
      fill_in 'message', with: message
      fill_in 'tags', with: tags.join(',')
      click_button('Post message!')
    end
  end
end