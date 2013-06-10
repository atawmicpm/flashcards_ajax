get '/deck/create' do
  erb :create_deck
end

post '/deck/create' do

  deck = Deck.create(topic: params[:topic])



  params[:questions].each do |question|
    deck.cards.create(question)
  end
  
  redirect "/profile/#{current_user.id}"
end

get '/deck/:deck_id' do |deck_id|
  @deck = Card.where("deck_id = ?", deck_id)
  @topic = Deck.find(deck_id).topic

  erb :deck
end
