class ForecastsController < ApplicationController
  before_action :authenticate_member!

  # GET /forecasts
  # GET /forecasts.json
  def index
    @matches = Match.joins(:forecasts).where(forecasts: {member: current_member}).group_by(&:group).sort_by { |group, _| group }
  end

  # POST /forecasts
  # POST /forecasts.json
  def create
    params.require(:forecast).each do |match_id, attrs|
      user_forecast = Forecast.find_or_create_by(member_id: current_member.id, match_id: match_id)
      user_forecast.update_attributes(attrs)
    end

    flash[:notice] = 'Pronostico actualizado correctamente'
    redirect_to forecasts_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def forecast_params
      params.require(:forecast).permit(:team1_score, :team2_score, :match_id, :winner_id)
    end
end
