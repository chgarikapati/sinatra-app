require 'sequel'
require_relative '../../app/models/book'
require_relative '../../app/models/authors'
require_relative '../../app/models/author_books'

class BookServices
  def list_all_books
    Book.each { |book| p book}
  end

  def list_all_books_by_author(author_id)
    unless author_id.nil? || author_id == ''
      author = Authors.with_pk(author_id)
      return author.books unless author.nil?
    end
  end

  def show_book_details_for_author(author_id, book_id)
    Book.where(published_by: author_id, books_id: book_id).first
  end
end

#p BookServices.new.list_all_books
#p BookServices.new.show_book_details_for_author(1,1)
