class Card < ActiveRecord::Base
	has_many :guesses
	has_many :rounds, :through => :guesses
	belongs_to :deck
	

  def correct?(user_guess)
    user_guess == self.answer
  end

  # Remember to create a migration!
end
