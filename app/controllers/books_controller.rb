require 'sinatra'
require 'sinatra/json'
require_relative '../../app/services/book_services'

@@BOOKS_SERVICE ||= BookServices.new

get '/authors/:author_id/books/:book_id' do |author_id, book_id|
  response = @@BOOKS_SERVICE.show_book_details_for_author(author_id, book_id)
  json(response.values) unless response.nil?
end

get '/authors/:author_id/books' do |author_id|
  result = @@BOOKS_SERVICE.list_all_books_by_author(author_id)
  response = []
  result.each { |book| response.push(json(book.values)) }
  response
end
