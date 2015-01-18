class Post

  include DataMapper::Resource

  property :id,       Serial
  property :message,  Text
  property :tags,     String

end