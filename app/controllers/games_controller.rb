require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @pletters = params[:letters].split
    @word = params[:word].upcase
    response = URI.open("https://wagon-dictionary.herokuapp.com/#{@word}")
    json = JSON.parse(response.read)
    @found = json['found']
    @included = @word.chars.all? { |letter| @word.count(letter) <= @pletters.count(letter) }
  end
end
