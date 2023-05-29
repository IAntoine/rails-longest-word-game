require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @guess = params[:guess]
    @result = validate_word(@guess)
  end

  private

  def validate_word(guess)
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{guess}")
    json = JSON.parse(response.read)

    if json['found']
      "Valid word!"
    else
      "Invalid word!"
    end
  end
end
