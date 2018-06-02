class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include UserSessionHelper

  def user_logged_in?
    if !logged_in?
      redirect_to root_path
    end
  end

  def user_is_admin?
    if !current_user.is_admin?
      redirect_to root_path
    end
  end

  def user_is_establishment?
    if !current_user.is_establishment?
      redirect_to root_path
    end
  end

end
