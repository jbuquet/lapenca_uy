json.array!(@teams) do |team|
  json.extract! team, :id, :name, :coach, :group
  json.url team_url(team, format: :json)
end
