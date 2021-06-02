# frozen_string_literal: true

require 'sequel'
require 'mysql2'

class SetupDbConnection

  @@DB_CONNECTION = nil

  # @return [Sequel:DB]
  def self.setup_connection
    if @@DB_CONNECTION.nil?
      @@DB_CONNECTION = Sequel.connect(adapter: :mysql2, database: 'test', host: 'localhost', user: 'tester', password: 'passw0rd@123')
    else
      @@DB_CONNECTION
    end
  end

end

DB = SetupDbConnection.setup_connection;
