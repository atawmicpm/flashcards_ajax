class User < ActiveRecord::Base
	has_secure_password

	has_many :rounds
	has_many :guesses, :through => :rounds
  # Remember to create a migration!

  validates :email, :uniqueness => true
  validates :email, :password, :name, :presence => true
  # Remember to create a migration!

  def check_password(password)
    self.try(:authenticate, password)
  end
  
end
