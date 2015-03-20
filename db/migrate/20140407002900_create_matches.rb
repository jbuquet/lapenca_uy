class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.datetime :date
      t.integer :team1_id
      t.string :team1_description
      t.integer :team1_score
      t.integer :team2_id
      t.string :team2_description
      t.integer :team2_score
      t.integer :winner_id
      t.integer :arena_id

      t.timestamps
    end
  end
end
