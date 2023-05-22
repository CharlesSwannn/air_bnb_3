class ApplicationController < ActionController::Base
  def points
    session[:pontos] = 0
  end
end
