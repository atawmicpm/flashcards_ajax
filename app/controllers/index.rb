enable :sessions

get '/' do
    redirect "/profile/#{current_user.id}" if session[:user_id]
    erb :index
end

get '/profile/:id' do |id|
  @rounds = Round.where('user_id = ?', current_user.id)
  erb :profile
end

get '/game/:topic_id' do |topic_id|
  @card = Round.first_card(topic_id, session[:user_id])	
  erb :game
end

post '/game' do
  content_type 'json'
  Round.answer_and_next_card(session[:user_id], params[:answer]).to_json
end
                                                                                                                                                                                                                                                                                                                                  



