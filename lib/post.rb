require 'data_mapper'

class Post

  include DataMapper::Resource

  has n, :tags, :through => Resource
  belongs_to :user

  property :id,       Serial
  property :message,  Text
end