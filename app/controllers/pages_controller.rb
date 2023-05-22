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
    @letters = params[:letters].split(" ")
    @answer = params[:word_answer]
    @array = @answer.split("")
    @hello = "nop"

    @array.each do |letter|
      if @letters.include?(letter)
      @hello = "oi"
      else
      @hello = "nop"
      end
    end
  end
end
