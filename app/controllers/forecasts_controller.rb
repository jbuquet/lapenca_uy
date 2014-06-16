class ForecastsController < ApplicationController
  before_action :authenticate_member!

  # GET /forecasts
  # GET /forecasts.json
  def index
    @matches = Match.all

    if (Date.parse('2014-06-11') >= Time.zone.now.to_date)
      render :index_groups_stage
    elsif Match.where(stage: 16, pos_in_stage: 1).first.team1_id.present? and Date.parse('2014-06-27') >= Time.zone.now.to_date
      render :index_playoffs_stage
    else
      render :index_no_stage
    end
  end

  # POST /forecasts
  # POST /forecasts.json
  def create
    params.require(:forecast).sort_by{|match_id,_| match_id}.each do |match_id, attrs|
      complete = true

      if attrs['team1_score'].present? and attrs['team2_score'].present?
        if (update_forecast_available(match))
          team1_score = attrs['team1_score'].split('*').first.to_i
          team2_score = attrs['team2_score'].split('*').first.to_i

          match = Match.find(match_id)

          if match.stage <= 16
            if match.stage == 16
              attrs['team1_id'] = match.team1_id
              attrs['team2_id'] = match.team2_id
            else
              if match.stage == 8
                if match.pos_in_stage == 1
                  parentMatch1 = Match.where(stage: 16, pos_in_stage: 1).first
                  parentMatch2 = Match.where(stage: 16, pos_in_stage: 2).first
                elsif match.pos_in_stage == 2
                  parentMatch1 = Match.where(stage: 16, pos_in_stage: 5).first
                  parentMatch2 = Match.where(stage: 16, pos_in_stage: 6).first
                elsif match.pos_in_stage == 3
                  parentMatch1 = Match.where(stage: 16, pos_in_stage: 3).first
                  parentMatch2 = Match.where(stage: 16, pos_in_stage: 4).first
                elsif match.pos_in_stage == 4
                  parentMatch1 = Match.where(stage: 16, pos_in_stage: 7).first
                  parentMatch2 = Match.where(stage: 16, pos_in_stage: 8).first
                end
              elsif match.stage == 4
                if match.pos_in_stage == 1
                  parentMatch1 = Match.where(stage: 8, pos_in_stage: 1).first
                  parentMatch2 = Match.where(stage: 8, pos_in_stage: 2).first
                else
                  parentMatch1 = Match.where(stage: 8, pos_in_stage: 3).first
                  parentMatch2 = Match.where(stage: 8, pos_in_stage: 4).first
                end
              else
                parentMatch1 = Match.where(stage: 4, pos_in_stage: 1).first
                parentMatch2 = Match.where(stage: 4, pos_in_stage: 2).first
              end

              if match.stage == 2 and match.pos_in_stage == 1
                attrs['team1_id'] = Forecast.find_or_create_by(member_id: current_member.id, match_id: parentMatch1.id).loser_id
                attrs['team2_id'] = Forecast.find_or_create_by(member_id: current_member.id, match_id: parentMatch2.id).loser_id
              else
                attrs['team1_id'] = Forecast.find_or_create_by(member_id: current_member.id, match_id: parentMatch1.id).winner_id
                attrs['team2_id'] = Forecast.find_or_create_by(member_id: current_member.id, match_id: parentMatch2.id).winner_id
              end
            end

            if team1_score > team2_score
              attrs['winner_id'] = attrs['team1_id']
            elsif team1_score < team2_score
              attrs['winner_id'] = attrs['team2_id']
            else
              if attrs['team2_score'].include? '*'
                attrs['winner_id'] = attrs['team2_id']
              else
                attrs['winner_id'] = attrs['team1_id']
              end
            end

            complete = false unless attrs['team1_id'].present? and attrs['team2_id'].present?
          end

          if complete
            user_forecast = Forecast.find_or_create_by(member_id: current_member.id, match_id: match_id)
            user_forecast.update_attributes(attrs)
          end
        end
      end
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
