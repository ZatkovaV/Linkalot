json.extract! vote, :id, :value, :link_id, :ip_address, :created_at, :updated_at
json.url vote_url(vote, format: :json)
