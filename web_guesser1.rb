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
  @message = check_guess(guess)

  erb :index, :locals => {:number  => SECRET_NUMBER,
                          :message => @message,
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
    start
  elsif guess < SECRET_NUMBER - 5
    low
  elsif guess < SECRET_NUMBER
    low_but_close
  elsif guess > SECRET_NUMBER + 5
    high
  elsif guess > SECRET_NUMBER
    high_but_close
  else
    restart_game
    @direction = "Congratulations!"
    winner
  end
end

def start
  @color = "background:#FBEFF2"
  @message = "Good luck!"
end

def low
  @color = "background: #F2F5A9"
  @message = "Way way too low. Muy bajo senor!"
end

def low_but_close
  @color = "background: #FE9A2E"
  @message = "Almost there. Go up a wee bit!"
end

def high
  @color = "background: #AEB404"
  @message = "Too cold, and too high. Try again!"
end

def high_but_close
  @color = "background: #BE81F7"
  @messsage = "Close! But its still high"
end

def winner
  @color = "background: #FA58D0"
  @message = "Yup! The SECRET NUMBER was #{SECRET_NUMBER}"
end

def cheat_mode
  @message = "The SECRET NUMBER is #{SECRET_NUMBER}"
end
