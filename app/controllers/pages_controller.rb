class PagesController < ApplicationController
  def ask; end
  def answer
    @question = params[:question]

    if @question == "I am going to work"
      @answer = "Great!"
    elsif @question.include?("?")
      @answer = "Silly question, get dressed and go to work!"
    else
      @answer = "I don't care, get dressed and go to work!"
    end
  end

  def word
    @letters = ('a'..'z').to_a.sample(10)
  end

  def game
    require "json"
    require "open-uri"
    @answer = params[:word_answer]
    @letters = params[:letters].split(" ")
    url = "https://wagon-dictionary.herokuapp.com/#{@answer}"
    @array = @answer.split("")
    serialized_dictionary = URI.open(url).read
    @test = JSON.parse(serialized_dictionary)

    if (@letters & @array).sort == @array.sort && @test["found"]
      @valid_answer = true
      session[:pontos] += 1
    else
      @valid_answer = false
    end
  end
end
