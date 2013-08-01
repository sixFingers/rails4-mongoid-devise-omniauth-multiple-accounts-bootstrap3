json.array!(@home) do |home|
  json.extract! home,
  json.url home_url(home, format: :json)
end
