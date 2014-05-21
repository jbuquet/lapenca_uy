json.array!(@forecasts) do |forecast|
  json.extract! forecast, :id, :team1_score, :team2_score, :match_id, :winner_id
  json.url forecast_url(forecast, format: :json)
end
