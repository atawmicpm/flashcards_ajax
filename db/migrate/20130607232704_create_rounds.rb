class CreateRounds < ActiveRecord::Migration
  def change
  	create_table :rounds do |t|
  		t.references :user
  		t.integer	:correct, :default => 0
  		t.integer	:incorrect, :default => 0
  		t.timestamps
  	end
  end
end
