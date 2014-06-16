class ResultsController < ApplicationController
  before_action :require_admin

  # GET /resultados/actualizar
  # GET /resultados/actualizar.json
  def index
    @matches = Match.all
  end

  # POST /resultados/actualizar
  # POST /resultados/actualizar.json
  def create
    params.require(:result).sort_by{|match_id,_| match_id}.each do |match_id, attrs|
      complete = true
      match = Match.find(match_id)

      if attrs['team1_score'].present? and attrs['team2_score'].present?

        team1_score = attrs['team1_score'].split('*').first.to_i
        team2_score = attrs['team2_score'].split('*').first.to_i

        if match.stage <= 16
          attrs['team1_id'] = match.team1_id
          attrs['team2_id'] = match.team2_id

          if match.stage < 16
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
              attrs['team1_id'] = parentMatch1.loser_id
              attrs['team2_id'] = parentMatch2.loser_id
            else
              attrs['team1_id'] = parentMatch1.winner_id
              attrs['team2_id'] = parentMatch2.winner_id
            end

            complete = false unless attrs['team1_id'].present? and attrs['team2_id'].present?
          end

          if complete
            if team1_score > team2_score
              attrs['winner_id'] = attrs['team1_id']
            elsif team1_score < team2_score
              attrs['winner_id'] = attrs['team2_id']
            else
              if attrs['team2_score'].include? '*'
                attrs['winner_id'] = attrs['team2_id']
                attrs['team2_score'] = team2_score
              else
                attrs['winner_id'] = attrs['team1_id']
                attrs['team1_score'] = team1_score
              end
            end
          end
        end

        match.attributes = attrs
        if match.changed? and complete
          match.save
          Forecast.update_user_points(match)
        end
      else
        match.team1_score = nil
        match.team2_score = nil
        match.winner_id = nil

        match.save
      end
    end

    flash[:notice] = 'Resultados actualizados correctamente'
    redirect_to points_path
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def results_params
    params.require(:result).permit(:team1_score, :team2_score, :match_id)
  end

  def require_admin
    unless current_member and current_member.is_admin
      redirect_to matches_path
    end
  end
end
