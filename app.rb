#!/usr/bin/env ruby
require 'sinatra'
require "sinatra/activerecord"
require './env'


set :database_file, "database.yml"



SERVING_URL = ENV['serving_url']
PASS = ENV['PASS']
HASH_SET = {}


get "/" do
	content_type :json
	"hello there!".to_json
end

get "/:addr" do
	if HASH_SET[params["addr"]].nil?
		status 404
	else
		redirect HASH_SET[params["addr"]]
	end
end 

post "/add/" do
	json_params = JSON.parse(request.body.read.to_s)
	if json_params['pwd'] != PASS
		status 401
	else
		HASH_SET[json_params['short']] = json_params["url"]
		puts json_params['short'] + " " + HASH_SET[json_params['short']] + " " + HASH_SET.length.to_s
		response = {}
		response['url'] = SERVING_URL + json_params['short']
		response['redir'] = HASH_SET[json_params['short']]
		response['size'] = HASH_SET.length
		status 200
		response.to_json	
	end
	
end


