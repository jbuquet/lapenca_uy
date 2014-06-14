class PointsController < ApplicationController
  before_action :require_admin

  # GET /puntos
  # GET /puntos.json
  def index
    @points = Member.all.sort_by {
        |member| (member.points_to_add.present? ? member.points_to_add : 0)
    }.reverse
  end

  # POST /puntos
  # POST /puntos.json
  def create
    Member.all.each { |member|
      member.assign_points
    }

    flash[:notice] = 'Puntos asignados correctamente'
    redirect_to matches_path
  end

  # POST /puntos/recalcular
  def recalculate
    Member.includes(:forecasts).each do |member|
      member.recalculate_points
    end

    flash[:notice] = 'Puntos recalculados correctamente'
    redirect_to root_path
  end

  private
  def require_admin
    unless current_member and current_member.is_admin
      redirect_to matches_path
    end
  end
end
