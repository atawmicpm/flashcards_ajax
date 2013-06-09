class Round < ActiveRecord::Base
	has_many :guesses
	has_many :cards, :through => :guesses
  has_one  :deck, :through => :cards
  belongs_to :user

  def self.first_card(topic_id, user_id)
    user = User.find(user_id)
    user.rounds << Round.create(deck_id: topic_id)
    user.rounds.last.cards << Card.where('deck_id = ?', topic_id).shuffle
    guess = user.guesses.where('round_id = ?', user.rounds.last.id).first
    Card.find(guess.card_id)
  end


  def self.answer_and_next_card(user_id, answer)
    user = User.find(user_id)

    guess = user.guesses.where('round_id = ?', user.rounds.last.id).first.destroy
    card = Card.find(guess.card_id)

    if card.correct?(answer)
      user.rounds.last.increment('correct').save
      @previous_answer = "Correct! The answer is #{card.answer}!"
    else
      user.rounds.last.increment('incorrect').save
      @previous_answer = "Incorrect! The answer is #{card.answer}!"
    end

    guess = user.guesses.where('round_id = ?', user.rounds.last.id).first
    card = Card.find(guess.card_id)

    round_guesses = user.guesses.where('round_id = ?', user.rounds.last.id).length.to_i

    if round_guesses == 0
      return ["redirect"].to_json
    else
      return [card.question, card.id, @previous_answer]
    end

  end

end
