require 'data_mapper'

class Post

  include DataMapper::Resource

  property :id,       Serial
  property :message,  Text

end