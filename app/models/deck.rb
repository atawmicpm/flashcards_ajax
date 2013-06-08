class Deck < ActiveRecord::Base
	has_many :cards

	validates :uniqueness => true
  # Remember to create a migration!
end
