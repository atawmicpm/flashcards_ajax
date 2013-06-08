#User.create(name: 'Phillip', email: 'atawmicpm@gmail.com', password_digest: 'test')

#Card.create(question: 'Is Ruby cool?', answer: 'yes', deck_id: 1)
#Card.create(question: 'What does a class statement start with?', answer: 'class', deck_id: 1)

#topic = Deck.create(topic: 'Ruby')

# lines_array = File.readlines('ruby_cards.txt',"\n\n").map { |a| a.split("\n") }
# lines_array.collect { |pair| Card.create(question: pair[0], answer: pair[1], deck_id: 1)}

require 'csv'
system("pwd")
topic = Deck.create(topic: "Ruby")

lines_array = File.readlines('ruby_cards.txt',"\n\n").map { |a| a.split("\n") }
lines_array.collect { |pair| Card.create(question: pair[0], answer: pair[1], deck_id: 1)}

periodic = Deck.create(topic: "Periodic Table")
CSV.foreach('periodictable.csv', headers:true) do |data|
  Card.create(question: data[1], answer: data[0], deck_id: 2)
end

capitals = Deck.create(topic: "World Capitals")
CSV.foreach('worldcapitals.csv', headers:true) do |data|
  Card.create(question: data[0], answer: data[1], deck_id: 3)
end

# phillip = User.find(1)

# phillip.rounds << Round.new

# phillip.rounds.last.cards << Card.where('deck_id = ?', 1)



# phillip.rounds.last.guesses.where('card_id = ?', 1)

#  #[#<Guess id: 4, card_id: 1, round_id: 3, answer: nil>] 

#  => [#<Guess id: 4, card_id: 1, round_id: 3, answer: nil>] 

#  .9.3-p429 :060 > phillip.rounds[2].cards
#  => [#<Card id: 1, deck_id: 1, question: "Is Ruby cool?", answer: "yes">, 
#  #<Card id: 2, deck_id: 1, question: "What does a class statement start with?", answer: "class">] 


#  1.9.3-p429 :064 > phillip.rounds[2].guesses.first.answer = "yes"
#  => "yes" 
# 1.9.3-p429 :065 > phillip.rounds[2].guesses
#  => [#<Guess id: 4, card_id: 1, round_id: 3, answer: "yes">


#  	card = phillip.rounds[2].cards.shift
#  => #<Card id: 1, deck_id: 1, question: "Is Ruby cool?", answer: "yes"> 
