json.extract! user, :id, :user_type_id, :name, :email, :password_digest, :active, :created_at, :updated_at
json.url user_url(user, format: :json)
