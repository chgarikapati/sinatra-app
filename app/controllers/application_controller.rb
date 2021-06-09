require 'sinatra'
require 'require_all'

class ApplicationController < Sinatra::Base
  get '/' do
    'Sinatra Sequel Application !!'
  end
end
