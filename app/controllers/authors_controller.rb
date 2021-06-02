require 'sinatra'
require 'sinatra/json'
require_relative '../../app/services/author_services'

@@AUTHOR_SERVICE = AuthorServices.new

get '/authors' do
  results = @@AUTHOR_SERVICE.list_all_authors
  response = []
  results.each {|result| response.push(json(result.values)) }
  return response
end

get '/authors/:id' do |id|
  response = @@AUTHOR_SERVICE.show_author_info(id).values
  json(response)
end

post '/authors/create' do
  data = JSON.parse(request.body.read)
  puts data[name]
end
