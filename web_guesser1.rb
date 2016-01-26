require 'sinatra'
require 'sinatra/reloader'
require 'pry'

@@count = 6
SECRET_NUMBER = rand(100)
@color = "background:#FBEFF2"

get '/' do
guess = params['guess'].to_i
count
message = check_guess(guess)
# count
erb :index, :locals => {:number  => SECRET_NUMBER,
                        :message => message,
                        :color => @color
                        }
end

 def count
   if @@count == 0
     message = "Restart game with 5 new tries"
     restart_game
   else
     @@count -= 1
   end
 end

 def restart_game
   SECRET_NUMBER
   @@count = 5
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
  else
    @color = "background: #FA58D0"
    message = "Yup! The SECRET NUMBER was #{SECRET_NUMBER}"
    restart_game
  end
end


  # <!-- <p>
  # "<%= display_message %>"
  # </p> -->
