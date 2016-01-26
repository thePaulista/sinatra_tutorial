require 'sinatra'
require 'sinatra/reloader'
require 'pry'

SECRET_NUMBER = rand(100)
@color = "background:#FBEFF2"
@@count = 6
@direction

get '/' do
welcome
count

guess = params['guess'].to_i
if params['cheat']
  return cheat_mode
end
message = check_guess(guess)


erb :index, :locals => {:number  => SECRET_NUMBER,
                        :message => message,
                        :color => @color,
                        :direction => @direction
                        }
end

def welcome
  if @@count == 6
    @direction = "Guess a number between 0-99"
  else
    @direction = "Keep going"
  end
end

 def count
   if @@count == 1
     @direction = "Restart game with 5 new tries"
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
  if @@count == 5
    @color = "background:#FBEFF2"
    message = "Good luck!"
  elsif guess && params["&cheat=true"]
    message   = "#{SECRET_NUMBER}"
  elsif guess < SECRET_NUMBER - 5
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

def cheat_mode
  @color
  @direction = "The SECRET NUMBER is #{SECRET_NUMBER}"
end
