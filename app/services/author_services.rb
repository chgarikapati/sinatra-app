require 'sequel'
require 'logger'
require_relative '../../app/models/authors'
require_relative '../../app/models/book'

# This service class is used to perform operation on Authors
class AuthorServices
  @logger = Logger.new($stderr)

  def list_all_authors
    Authors.all
  end

  def add_new_author(name, age)
    author = Authors.new
    author.set(name: name, age: age)
    author.save
  rescue Sequel::ValidationFailed => e
    @logger.fatal("Failed to create new author - #{e.message}")
    nil
  end

  # update issues new query for every change ?
  def update_author(author_id, name = nil, age = nil)
    authors = Authors.with_pk(author_id)
    unless authors.nil?
      authors.name = (name) unless name.nil?
      authors.age = (age) unless age.nil?
      authors.save
    end
  end

  #   def update_author(author_id, name = nil, age = nil)
  #     authors = Authors.with_pk(author_id)
  #     authors&.update_fields({ name: name, age: age }, %i[name age], missing: :skip)
  #   end

  # Shows specific author info
  def show_author_info(author_id)
    Authors.with_pk(author_id)
  end

  def delete_author(author_id)
    author = Authors.with_pk(author_id)
    author&.delete
  end
end

# p AuthorServices.new.list_all_authors
# p AuthorServices.new.list_all_books_by_author(1)
# p AuthorServices.new.add_new_author('dinesh', 26)
# p AuthorServices.new.update_author(4, 'chetu-3',45)
# p AuthorServices.new.show_author_info(1)
# p AuthorServices.new.delete_author("1")
