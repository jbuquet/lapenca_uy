class Match < ActiveRecord::Base
  #validates :date, presence: true
  #validates :arena_id, presence: true

  belongs_to :team1, :class_name => 'Team'
  belongs_to :team2, :class_name => 'Team'
  belongs_to :arena
  has_many   :forecasts

  def winner
    raise 'Match score not entered' unless team1_score && team2_score
    if team1_score == team2_score
      winner_id ? Team.find(winner_id) : raise('Winner not entered')
    else
      team1_score > team2_score ? team1 : team2
    end
  end

  def draw?
    raise 'Match score not entered' unless team1_score && team2_score
    team1_score == team2_score
  end

  def result_sym
    if draw?
      :draw
    else
      if team1_score > team2_score
        :team1
      else
        :team2
      end
    end
  end

  def description
    "#{team1.try :name} #{team1_score || '*'} - #{team2_score || '*'} #{team2.try :name}"
  end

  def loser_id
    if winner_id == team1_id
      team2_id
    elsif winner_id == team2_id
      team1_id
    end
  end
end
