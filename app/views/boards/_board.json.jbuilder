json.extract! board, :id, :user_id, :name, :created_at, :updated_at
json.url board_url(board, format: :json)