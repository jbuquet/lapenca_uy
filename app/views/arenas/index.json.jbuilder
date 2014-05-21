json.array!(@arenas) do |arena|
  json.extract! arena, :id, :name, :city, :capacity
  json.url arena_url(arena, format: :json)
end
