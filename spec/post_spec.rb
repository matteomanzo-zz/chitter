require 'spec_helper'
require 'post'

describe Post do

  it 'should be created and retrieved from the database' do
    expect(Post.count).to eq(0)
    Post.create(message: 'Makers Academy, learn how to code in 12 weeks',
                tags: 'ruby')
    expect(Post.count).to eq(1)
    post = Post.first
    expect(post.message).to eq('Makers Academy, learn how to code in 12 weeks')
    expect(post.tags).to eq('ruby')
    post.destroy
    expect(Post.count).to eq(0)
  end

end