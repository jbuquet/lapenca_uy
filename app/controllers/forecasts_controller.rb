class ForecastsController < ApplicationController
  before_action :set_forecast, only: [:show, :edit, :update, :destroy]

  # GET /forecasts
  # GET /forecasts.json
  def index
    @forecasts = Forecast.all
  end

  # GET /forecasts/1
  # GET /forecasts/1.json
  def show
  end

  # GET /forecasts/new
  def new
    @forecast = Forecast.new
  end

  # GET /forecasts/1/edit
  def edit
  end

  # POST /forecasts
  # POST /forecasts.json
  def create
    @forecast = Forecast.new(forecast_params)

    respond_to do |format|
      if @forecast.save
        format.html { redirect_to @forecast, notice: 'Forecast was successfully created.' }
        format.json { render action: 'show', status: :created, location: @forecast }
      else
        format.html { render action: 'new' }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forecasts/1
  # PATCH/PUT /forecasts/1.json
  def update
    respond_to do |format|
      if @forecast.update(forecast_params)
        format.html { redirect_to @forecast, notice: 'Forecast was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forecasts/1
  # DELETE /forecasts/1.json
  def destroy
    @forecast.destroy
    respond_to do |format|
      format.html { redirect_to forecasts_url }
      format.json { head :no_content }
    end
  end

  def forecast
    @matches = Match.joins("LEFT OUTER JOIN forecasts ON forecasts.match_id = matches.id AND forecasts.member_id = #{current_member.id}").group_by(&:group)
    puts @matches.inspect
  end

  def save_forecast
    params.require(:forecast).each do |match_id, attrs|
      forecast = Forecast.find_or_create_by(member_id: current_member.id, match_id: match_id)
      puts forecast.inspect
      forecast.update_attributes(attrs)
    end
    redirect_to forecast_forecasts_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast
      @forecast = Forecast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forecast_params
      params.require(:forecast).permit(:team1_score, :team2_score, :match_id, :winner_id)
    end
end
