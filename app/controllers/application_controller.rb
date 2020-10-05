class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? # Makes current_user available to views as well as application controllers
  def current_user
    # Checks if there is already a current user and uses that. If not then it runs the User.find command (stops multiple checks to db when accessing multiple )
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    # !! turns the variable into a bool
    !!current_user
  end

end
