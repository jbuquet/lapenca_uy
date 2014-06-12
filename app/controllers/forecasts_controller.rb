class ForecastsController < ApplicationController
  before_action :authenticate_member!

  # GET /forecasts
  # GET /forecasts.json
  def index
    if (Date.parse('2014-06-11') < Time.zone.now.to_date && current_member.id != 49 &&
      current_member.id != 127 && current_member.id < 149 )
      @matches = Match.all.group_by(&:group).sort_by { |group, _| group }
      render :index_no_stage
    else
      @matches = Match.all.group_by(&:group).sort_by { |group, _| group }
      render :index_groups_stage
    end
  end

  # POST /forecasts
  # POST /forecasts.json
  def create
    if (Date.parse('2014-06-11') < Time.zone.now.to_date && current_member.id != 49 &&
      current_member.id != 127 && current_member.id < 149 )
      flash[:alert] = 'Ya no se pueden actualizar los pronosticos'
    else
      params.require(:forecast).each do |match_id, attrs|
        user_forecast = Forecast.find_or_create_by(member_id: current_member.id, match_id: match_id)
        user_forecast.update_attributes(attrs)
      end

      flash[:notice] = 'Pronostico actualizado correctamente'
    end

    redirect_to forecasts_path
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def forecast_params
      params.require(:forecast).permit(:team1_score, :team2_score, :match_id, :winner_id)
    end
end
