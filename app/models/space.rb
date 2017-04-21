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

  def unavailable_dates
    unavailable_dates = []
    self.requests.each do |request|
      unavailable_dates << request.date if request.status == "accepted"
    end
    return unavailable_dates
  end

end
