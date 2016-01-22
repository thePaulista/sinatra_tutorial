require 'sinatra'
require 'sinatra/reloader'
# require 'pry'

number = rand(100)

get '/' do
  guess = params['guess'].to_i

  if guess < number
    message = "Too low, guess again:"
  elsif guess == number
    message = "you got it!"
  else
    message ="Too high, guess again"
  end

  erb :index, :locals => {:number => number, :message => message}

end
