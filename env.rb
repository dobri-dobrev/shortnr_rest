
configure :development do
	ENV['serving_url'] = "localhost:9292/"
end

configure :production do
	ENV['serving_url'] = "https://fierce-tundra-8657.herokuapp.com"
end