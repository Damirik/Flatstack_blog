json.extract! blog, :id, :subject, :user_id, :created_at, :updated_at
json.url blog_url(blog, format: :json)