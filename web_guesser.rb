require 'sinatra'
require 'sinatra/reloader'

  SECRET_NUMBER = rand(100)
  number = SECRET_NUMBER

  get '/' do
    guess = params["guess"]
    message = check_guess(guess, number) unless nil
    erb :index, :locals => {:number => number, :message => message}
  end

  def check_guess(guess, number)
    if guess.nil?
    elsif guess.to_i == number
      ["you got it right! The SECRET NUMBER is #{guess}"]
    elsif guess.to_i > number + 5
      ["Way too high!"]
    elsif guess.to_i > number
      ["Too high!"]
    elsif guess.to_i < number - 5
      ["Way too low!"]
    elsif guess.to_i < number
      ["Too low!"]
    end
  end
