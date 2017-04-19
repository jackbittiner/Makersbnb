class Request

  include DataMapper::Resource

  property :id, Serial
  property :status, String
  property :date, Date

  belongs_to :user
  belongs_to :space

end
