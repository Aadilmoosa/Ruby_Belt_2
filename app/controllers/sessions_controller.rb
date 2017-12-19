class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    def new
        # no need for functionality because all we want to do is render a login page
        # this page that is rendered is a login form that has method post to sessions
        # http://localhost:3000/sessions/new
    end
    def create
        user = User.find_by(email: params[:email])
        if user
            if user.try(:authenticate, params[:password])
                session[:user_id] = user.id
                return redirect_to user_path user.id  #change this later on!!!
            end
            flash[:errors] = ["Guess again boi"]
        else
            flash[:errors] = ["Bruh"]
        end
        return redirect_to :back
    end
    def destroy
        session[:user_id] = nil
        return redirect_to new_session_path
    end
end
