json.array!(@antennas) do |antenna|
  json.extract! antenna, :id
  json.url antenna_url(antenna, format: :json)
end
