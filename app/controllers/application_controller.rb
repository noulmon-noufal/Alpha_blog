class ApplicationController < ActionController::Base
  def index
  end

  def about

  end

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You mus login to perform this action"
      redirect_to root_path
    end
  end
end
