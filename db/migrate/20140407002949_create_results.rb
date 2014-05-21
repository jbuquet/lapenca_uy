class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :match_id
      t.integer :team1_score
      t.integer :team2_score
      t.integer :winner_id

      t.timestamps
    end
  end
end
