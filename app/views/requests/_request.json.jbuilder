json.extract! request, :id, :title, :body, :start, :finish, :publication_id, :user_id, :owner, :status, :created_at, :updated_at
json.url request_url(request, format: :json)
