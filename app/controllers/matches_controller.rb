class MatchesController < ApplicationController
  def index
    @matches = Match.where(stage: 32).all.sort_by(&:stage).reverse.sort_by(&:pos_in_stage).group_by(&:group).sort_by { |group| group }
  end

  def show
  end
end
