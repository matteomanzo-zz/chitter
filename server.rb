require 'sinatra/base'
require 'data_mapper'

class Chitter < Sinatra::Base

  env = ENV['RACK_ENV'] || 'development'

  DataMapper.setup(:default, "postgres://localhost/chitter_#{env}")

  require './lib/post.rb'
  require './lib/tag.rb'

  DataMapper.finalize

  DataMapper.auto_upgrade!

  get '/' do
    @posts = Post.all
    erb :index
  end

  post '/posts' do 
    message = params['message']
    tags = params["tags"].split(",").map do |tag|
      Tag.first_or_create(text: tag)
    end
    Post.create(message: message, tags: tags)
    redirect to('/')
  end 

  # start the server if ruby file executed directly
  run! if app_file == $0
end
