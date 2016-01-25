require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)
@color = "background:#FBEFF2"

get '/' do
  guess = params['guess'].to_i
  message = check_guess(guess)

  erb :index, :locals => {:number  => SECRET_NUMBER,
                          :message => message,
                          :color => @color
                          }
end

  def check_guess(guess)
    if guess < SECRET_NUMBER - 5
      @color = "background: #F2F5A9"
      message = "Way way too low. Muy bajo senor!"
    elsif guess < SECRET_NUMBER
      @color = "background: #FE9A2E"
      message = "Almost there. Go up a wee bit!"
    elsif guess > SECRET_NUMBER + 5
      @color = "background: #AEB404"
      message = "Too cold, and too high. Try again!"
    elsif guess > SECRET_NUMBER
      @color = "background: #BE81F7"
      messsage = "Close! But its still high"
    elsif guess = NAN
      message = "Numbers only please"
    else
      @color = "background: #FA58D0"
      message = "Yup! The SECRET NUMBER was #{SECRET_NUMBER}"
    end
  end


  # <!-- <p>
  # "<%= display_message %>"
  # </p> -->
