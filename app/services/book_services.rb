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

  def add_book_for_author(author_id, book_name, book_rating)
    book = Book.new
    book.set(published_by: author_id, name: book_name, rating: book_rating)
    book.save

    unless book.nil?
      author_books = AuthorBooks.new
      author_books.set(authors_id: author_id,books_id: book[:books_id])
      author_books.save
    end
  end

  def delete_book(author_id, book_id)
    author_books = AuthorBooks.where(authors_id: author_id, books_id: book_id)
    author_books&.delete

    book = Book.with_pk(book_id)
    book&.delete
  end
end

#p BookServices.new.list_all_books
#p BookServices.new.show_book_details_for_author(1,1)
#p BookServices.new.add_book_for_author(1,'chetan-3',5)
