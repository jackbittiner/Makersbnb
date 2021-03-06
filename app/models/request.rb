class Request

  include DataMapper::Resource

  # attr_accessor :status

  property :id, Serial
  property :status, String
  property :date, Date, required: true

  belongs_to :user
  belongs_to :space

end
