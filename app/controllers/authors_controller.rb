require 'sinatra'
require 'sinatra/json'
require_relative '../../app/services/author_services'

@@AUTHOR_SERVICE ||= AuthorServices.new

get '/authors' do
  results = @@AUTHOR_SERVICE.list_all_authors
  response = []
  results.each {|result| response.push(json(result.values)) }
  return response
end

get '/authors/:author_id' do |author_id|
  response = @@AUTHOR_SERVICE.show_author_info(author_id)
  json(response.values) unless response.nil?
end

post '/authors/create' do
  data = JSON.parse(request.body.read)
  response = @@AUTHOR_SERVICE.add_new_author(data['name'],data['age'])
  json(response.values)
end

patch '/authors/:author_id' do |author_id|
  data = JSON.parse(request.body.read)
  response = @@AUTHOR_SERVICE.update_author(author_id,data['name'],data['age'])
  json(response.values) unless response.nil?
end

delete '/authors/:author_id' do |author_id|
  response = @@AUTHOR_SERVICE.delete_author(author_id)
  json(response.values) unless response.nil?
end



