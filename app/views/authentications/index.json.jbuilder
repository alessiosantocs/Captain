json.array!(@authentications) do |authentication|
  json.extract! authentication, :id, :user_id, :provider, :uid, :access_token
  json.url authentication_url(authentication, format: :json)
end
