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

get '/update/deck/:deck_id' do |id|
	@deck = Deck.find(id)
	@cards = Card.where('deck_id = ?', id)
	erb :update_deck
end

post '/update/deck/:deck_id' do |id|
	p "HERE ARE SOME PARAMS__ #{params}"
	deck = Deck.find(id)

	deck.update_attributes(topic: params[:topic])

	# params[:questions].each do |question|
 #    deck.cards.each do |card|
    	
 #    	card.update_attributes(question)
 #    end
 #  	end
  # end

	redirect "/profile/#{current_user.id}"
end

get '/delete/deck/:id' do |id|
	Deck.destroy(id)
	redirect "/profile/#{current_user.id}"
end

get '/delete/card/:id' do |id|
	Card.destroy(id)
	redirect "/profile/#{current_user.id}"
end




