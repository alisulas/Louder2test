json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :admin, :remember_digest, :password_digest
  json.url user_url(user, format: :json)
end
