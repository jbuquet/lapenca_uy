class Forecast < ActiveRecord::Base
  belongs_to :member
  belongs_to :match

  def self.update_user_points(match)
    match.forecasts.each do |forecast|
      forecast.member.add_points forecast.calculate_points
    end
  end

  def calculate_points
    @@points_logger ||= Logger.new("#{Rails.root}/log/member_points.log")
    points = 0
    reasons = []
    if match.team1_score.present? && match.team2_score.present?
      if match.result_sym == result_sym
        points += 20
        reasons << :winner_draw
      end
      if match.team1_score == team1_score
        points += 10
        reasons << :team1_score
      end
      if match.team2_score == team2_score
        points += 10
        reasons << :team2_score
      end
      if match.team1_score == team1_score && match.team2_score == team2_score
        points += 10
        reasons << :exact_result
      end
    end
    member_info = member.try(:full_name) || 'Unknown'
    @@points_logger.info("#{match.try :description}")
    @@points_logger.info("#{member_info} forecasted (#{description}) and scores #{points} points (#{reasons.to_sentence})")
    points
  end

  def description
    "#{team1_score} - #{team2_score}"
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

  def draw?
    team1_score == team2_score
  end
end
