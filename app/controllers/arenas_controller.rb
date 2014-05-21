class ArenasController < ApplicationController
  before_action :set_arena, only: [:show]

  # GET /arenas
  # GET /arenas.json
  def index
    @arenas = Arena.all
  end

  # GET /arenas/1
  # GET /arenas/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arena
      @arena = Arena.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def arena_params
      params.require(:arena).permit(:name, :city, :capacity)
    end
end
