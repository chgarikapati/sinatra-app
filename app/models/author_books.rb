require 'sequel'
#require_relative '../../app/initialization/setup_db_connection'

class AuthorBooks < Sequel::Model
  plugin :validation_helpers

  def validate
    validates_presence %i[authors_id books_id]
  end
end
