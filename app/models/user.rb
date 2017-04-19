require 'bcrypt'

class User

  include DataMapper:: Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :username, String, unique: true
  property :firstname, String
  property :lastname, String
  property :email, String, unique: true
  property :password_digest, Text

  has n, :spaces
  has n, :requests


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
end

  validates_confirmation_of :password
  validates_presence_of :email, :firstname, :lastname, :password
  validates_format_of :email, as: :email_address

end
