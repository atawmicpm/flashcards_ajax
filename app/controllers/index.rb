enable :sessions

get '/' do
  if session[:user_id]
    erb :profile
  else
    erb :index
  end
end

get '/game/:topic_id' do |topic_id|

	@user = User.find(session[:user_id])
	@user.rounds << Round.new
	@user.rounds.last.cards << Card.where('deck_id = ?', topic_id).shuffle!
	@card = @user.rounds.last.cards.first

  erb :game
end



post '/game' do
  content_type 'json'

  user = User.find(session[:user_id])
  card = user.rounds.last.cards.first.destroy
  correct = 0

  if card.correct?(params[:answer])
  	user.rounds.last.increment('correct').save
  	correct = 1
  else
  	user.rounds.last.increment('incorrect').save
  end

  card = user.rounds.last.cards.first

  [correct, card.question, card.id, card.answer].to_json
end
                                                                                                                                                                                                                                                                                                                                  



