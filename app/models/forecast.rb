class Forecast < ActiveRecord::Base
  belongs_to :member
  belongs_to :match

    t.integer  "team1_score"
    t.integer  "team2_score"

    t.integer  "team1_score"
    t.integer  "team2_score"

  def self.update_user_points(match)
    match.forecasts.each do |forecast|
      points = 0
      points += 2 if match.winner_id == forecast.winner_id || match.team1_score == match.team2_score && forecast.team1_score == forecast.team2_score
      points += 1 if match.team1_score == forecast.team1_score
      points += 1 if match.team2_score == forecast.team2_score
      points += 1 if match.team1_score == forecast.team1_score && match.team2_score == forecast.team2_score
    end
  end
end
