require 'data_mapper'

class Post

  include DataMapper::Resource

  has n, :tags, :through => Resource

  property :id,       Serial
  property :message,  Text

end