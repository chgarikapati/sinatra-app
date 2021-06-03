require 'sequel'
#require_relative '../../app/initialization/setup_db_connection'

class Book < Sequel::Model
  many_to_one :authors, key: :published_by
  plugin :validation_helpers

  def validate
    errors.add(:published_by, 'cannot be empty') if !published_by || published_by.nil?
    validates_presence %i[rating name]
  end
end
