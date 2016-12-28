class WelcomeController < ApplicationController
  def index
    flash[:warning] = "好了，睡吧"
  end
end
