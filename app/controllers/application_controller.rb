class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_team, :nav_categories
  helper_method :current_user

  def set_team
    @team = Team.new(session[:team])
  end

  def nav_categories
    @nav_categories = Category.all
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_admin?
    current_user && current_user.admin?
  end
end
