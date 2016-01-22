require 'sinatra'
require 'sinatra/reloader'
# require 'pry'

number = rand(100)

get '/' do
  erb :index, :locals => {:number => number}
end
