json.array!(@deployments) do |deployment|
  json.extract! deployment, :id, :version
  json.url deployment_url(deployment, format: :json)
end
