require '../../app/initialization/setup_db_connection'

class TestConnection
  def test_connection_setup
    connection = SetupDbConnection.setup_connection
  end
end

connection = TestConnection.new
puts connection.test_connection_setup
