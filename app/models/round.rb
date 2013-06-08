class Round < ActiveRecord::Base
	has_many :guesses
	has_many :cards, :through => :guesses
	belongs_to :user

  # Remember to create a migration!
end
