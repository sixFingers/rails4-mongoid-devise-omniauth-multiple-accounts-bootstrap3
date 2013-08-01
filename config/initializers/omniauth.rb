Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 'f771253f32d8583acdb8', '1120eb8c617550aa66599b6716f99a86bc2277a3', scope: 'user'
end