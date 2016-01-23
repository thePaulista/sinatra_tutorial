require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)

get '/' do

  guess = params['guess'].to_i

  if guess < SECRET_NUMBER - 5
    message = "Way way too low. Muy bajo senor/a!"
  elsif guess < SECRET_NUMBER
    message = "Almost there. Go up a wee bit!"
  elsif guess > SECRET_NUMBER + 5
    message = "Too cold, and too high. Try again!"
  elsif guess > SECRET_NUMBER
      messsage = "Close! But its still high"
  else
    message == "Yay!"
  end

  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
#
end
