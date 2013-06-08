class CreateGuesses < ActiveRecord::Migration
  def change
  	create_table :guesses do |t|
  		t.references :card
  		t.references :round
  	end
  end
end
