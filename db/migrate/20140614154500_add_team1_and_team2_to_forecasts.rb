class AddTeam1AndTeam2ToForecasts < ActiveRecord::Migration
  def change
    add_column :forecasts, :team1_id, :integer
    add_column :forecasts, :team2_id, :integer
  end
end
