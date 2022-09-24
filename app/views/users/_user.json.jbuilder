json.extract! user, :id, :created_at, :updated_at # rubocop:todo Layout/EndOfLine
json.url user_url(user, format: :json)
