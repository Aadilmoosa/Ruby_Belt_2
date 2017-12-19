class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :require_login
  def index
    # renders index page
  end
  def current_user
    User.find(session[:user_id]) if session[:user_id]
    # if session[:user_id]
    #     User.find(session[:user_id])
    # end
  end
  private
    def require_login
        redirect_to "/sessions/new" unless session[:user_id]
        # return redirect_to new_session_path unless session.has_key? "user_id"
    end
end
