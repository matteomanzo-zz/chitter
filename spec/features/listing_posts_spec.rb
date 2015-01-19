require 'spec_helper'

feature "User browses the list of links" do

  before(:each) {
    Post.create(:message => 'Makers Academy, learn how to code in 12 weeks')}

  scenario "when opening the home page" do
    visit '/'
    expect(page).to have_content("Makers Academy")
  end
end