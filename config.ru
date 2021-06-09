require 'sinatra'
require 'require_all'
require_relative 'app/initialization/setup_db_connection'
require_all 'app/controllers'

use AuthorsController
use BooksController

run ApplicationController