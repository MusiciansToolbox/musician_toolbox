json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password_digest, :description, :zipcode
  json.url user_url(user, format: :json)
end
