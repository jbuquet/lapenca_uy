class MatchesController < ApplicationController
  def index
    @matches = Match.all.group_by(&:group)
  end

  def new
    @match = Match.new
  end

  def show
  end
end
