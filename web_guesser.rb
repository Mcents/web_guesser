require 'sinatra'
require 'sinatra/reloader'

  SECRET_NUMBER = rand(100)
  number = SECRET_NUMBER

  get '/' do
    guess = params["guess"]
    message = check_guess(guess, number)[0]
    color = check_guess(guess, number)[1]
    erb :index, :locals => {:number => number, :message => message, :color => color}
  end

  def check_guess(guess, number)
    if guess.nil?
      [""]
    elsif guess.to_i == number
      ["you got it right! The SECRET NUMBER is #{guess}", "#35ED1C"]
    elsif guess.to_i > number + 5
      ["Way too high!", "#F90522"]
    elsif guess.to_i > number
      ["Too high!", "#ED919C"]
    elsif guess.to_i < number - 5
      ["Way too low!", "#F90522"]
    elsif guess.to_i < number
      ["Too low!", "#ED919C"]
    end
  end
