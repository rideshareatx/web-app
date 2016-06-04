class StaticController < ApplicationController
  def welcome
    redirect_to routes_path if current_user
  end
end
