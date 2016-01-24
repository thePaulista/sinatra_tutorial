require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)
DISPLAY_MSSG = "The secret number is #{SECRET_NUMBER}"
# @color = pink

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)

  erb :index, :locals => {:number  => SECRET_NUMBER,
                          :message => message,
                          :display_message => DISPLAY_MSSG
                          # :color => @color
                        }
end

  def check_guess(guess)
    if guess < SECRET_NUMBER - 5
      message = "Way way too low. Muy bajo senor!"
      # @color = pink
    elsif guess < SECRET_NUMBER
      message = "Almost there. Go up a wee bit!"
    elsif guess > SECRET_NUMBER + 5
      message = "Too cold, and too high. Try again!"
    elsif guess > SECRET_NUMBER
      messsage = "Close! But its still high"
    else
      message = "Yay!"
      DISPLAY_MSSG
    end
  end
