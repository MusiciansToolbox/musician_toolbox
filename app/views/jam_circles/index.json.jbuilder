json.array!(@jam_circles) do |jam_circle|
  json.extract! jam_circle, :id, :user_id, :name, :description, :open
  json.url jam_circle_url(jam_circle, format: :json)
end
