class ForecastsController < ApplicationController
  before_action :authenticate_member!

  # GET /forecasts
  # GET /forecasts.json
  def index
    @matches = Match.all

    # if (Date.parse('2014-06-11') < Time.zone.now.to_date)
    #   render :index_no_stage
    # else
      render :index_groups_stage
    # end
  end

  # POST /forecasts
  # POST /forecasts.json
  def create
    params.require(:forecast).each do |match_id, attrs|
      match = Match.find(match_id)

      # if (update_forecast_available(match))
        if attrs['team1_score'] > attrs['team2_score']
          attrs['winner_id'] = attrs['team1_id']
        elsif attrs['team1_score'] < attrs['team2_score']
          attrs['winner_id'] = attrs['team2_id']
        end
        user_forecast = Forecast.find_or_create_by(member_id: current_member.id, match_id: match_id)
        user_forecast.update_attributes(attrs)
      # end
    end

    flash[:notice] = 'Pronostico actualizado correctamente'

    redirect_to forecasts_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def forecast_params
      params.require(:forecast).permit(:team1_score, :team2_score, :match_id, :winner_id, :team1_id, :team2_id)
    end

    def update_forecast_available(match)
      (match.stage == 32 and Date.parse('2014-06-11') >= Time.zone.now.to_date) or
          (match.stage != 32 and Date.parse('2014-06-27') >= Time.zone.now.to_date)
    end
end
