require 'sinatra'
require 'sinatra/reloader'

get '/' do
  "THE SECRET numbero IS #{rand(100)}"
end
