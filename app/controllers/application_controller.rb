class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user
  helper_method :current_user, :logged_in?

  private
    def current_user
      @user ||= User.find(session[:user_id]) if logged_in?
    end

    def logged_in?
      session[:user_id]
    end

    def require_login
      return redirect_to root_path unless logged_in?
    end

end
