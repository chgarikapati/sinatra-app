require 'sequel'
require_relative '../../app/initialization/setup_db_connection'

class Book < Sequel::Model
  many_to_one :authors, key: :published_by
end
