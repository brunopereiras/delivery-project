class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include UserSessionHelper

  def user_logged_in?
    if !logged_in?
      redirect_to root_path
    end
    true
  end

  def user_is_admin?
    if !current_user.is_admin?
      redirect_to root_path
    end
    true
  end

  def user_is_establishment?
    if !current_user.is_establishment?
      redirect_to root_path
    end
    true
  end

  def show_pede_pizza_menu
    @should_show_pede_pizza_menu = true
  end

  def show_menu
    @should_show_menu = true
  end

end
