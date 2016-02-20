json.array!(@messages) do |message|
  json.extract! message, :id, :content, :is_notification
  json.url message_url(message, format: :json)
end
