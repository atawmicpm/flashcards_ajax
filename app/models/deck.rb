class Deck < ActiveRecord::Base
	has_many :cards

	validates :topic, :uniqueness => true
  # Remember to create a migration!
end
