class MatchesController < ApplicationController
  def index
    @matches = Match.all.sort_by { |match| match.id }.group_by(&:group).sort_by { |group| group }
  end

  def show
  end
end
