enable :sessions

post '/users/new' do
  user = User.create(name: params[:name], email: params[:email], password: params[:password_digest], password_confirmation: params[:pass_conf])
  erb :index
end

get '/logout' do
  session.clear
  erb :index
end

post '/login' do 

  user = User.find_by_email(params[:email])
  if user.check_password(params[:password_digest])
    session[:user_id] = user.id
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
  else
    erb :index
  end
end
