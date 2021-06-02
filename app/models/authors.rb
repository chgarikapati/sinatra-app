require 'sequel'
require_relative '../../app/initialization/setup_db_connection'

class Authors < Sequel::Model
  one_to_many :books, key: :published_by
  #self.strict_param_setting = false
end

