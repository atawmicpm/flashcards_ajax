class Deck < ActiveRecord::Base
	has_many :cards
  has_many :rounds

	validates :topic, :uniqueness => true
  # Remember to create a migration!
end
