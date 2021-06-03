require 'sequel'
#require_relative '../../app/initialization/setup_db_connection'

class Authors < Sequel::Model
  one_to_many :books, key: :published_by
  plugin :validation_helpers

  def validate
    validates_presence %i[name age]
  end
end

