class Space

  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :description, Text
  property :price, Float
  property :available_from, Date
  property :available_to, Date
  property :image_url, Text

  has n, :requests

  belongs_to :user

end
