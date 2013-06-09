enable :sessions

get '/' do
  if session[:user_id]
    @decks = Deck.all
    redirect "/profile/#{current_user.id}"
  else
    erb :index
  end
end

get '/profile/:id' do |id|
  @gravatar = gravatar_url(current_user.email)
  @rounds = Round.where('user_id = ?', current_user.id)
  @topics = []

  @rounds.each do |round|
    if round.guesses.length > 0
      card_id = round.guesses.last.card_id
      id = Card.find(card_id).deck_id
      @topics << Deck.find(id).topic
    end
  end

  @decks = Deck.all
  erb :profile
end

get '/game/:topic_id' do |topic_id|
  @gravatar = gravatar_url(current_user.email)
	@user = User.find(session[:user_id])
	p @user.rounds << Round.create
	p @user.rounds.last.cards << Card.where('deck_id = ?', topic_id).shuffle
	guess = @user.guesses.where('round_id = ?', @user.rounds.last.id).first
	@card = Card.find(guess.card_id)
  erb :game
end

post '/game' do
  content_type 'json'

  user = User.find(session[:user_id])
  round_guesses = user.guesses.where('round_id = ?', user.rounds.last.id).length.to_i
  @gravatar = gravatar_url(current_user.email)


  guess = user.guesses.where('round_id = ?', user.rounds.last.id).first.destroy
  card = Card.find(guess.card_id)
  correct = 0
  
  if card.correct?(params[:answer])
  	user.rounds.last.increment('correct').save
    @previous_answer = "Correct! The answer is #{card.answer}!"
  	correct = 1
  else
  	user.rounds.last.increment('incorrect').save
    @previous_answer = "Incorrect! The answer is #{card.answer}!"
  end

	guess = user.guesses.where('round_id = ?', user.rounds.last.id).first
  card = Card.find(guess.card_id)

  if round_guesses == 2
    return ["redirect"].to_json
  end

  [correct, card.question, card.id, @previous_answer].to_json
end
                                                                                                                                                                                                                                                                                                                                  



