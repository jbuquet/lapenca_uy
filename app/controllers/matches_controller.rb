class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def new
    @match = Match.new
  end

  def create
    @match = Match.new(params.require(:match).permit(:team1_id, :team2_id, :date, :arena_id))
    if @match.save
      redirect_to matches_path
    else
      render :new
    end
  end

  def show
  end

  def update
    @match = Match.find(params[:id])
    if @match.update_attributes(params.require(:match).permit(:team1_id, :team2_id, :date, :arena_id))
      redirect_to matches_path
    end
  end
end
