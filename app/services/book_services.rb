require 'sequel'
require '../../app/models/book'

class BookServices
  def list_all_books
    Book.each { |book| p book}
  end
end

BookServices.new.list_all_books
