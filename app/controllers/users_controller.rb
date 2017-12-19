class UsersController < ApplicationController
    skip_before_action :require_login, only: [:new, :create]
    before_action :require_correct_user, only: [:edit, :update, :destroy]
    # no need for an index page that shows any users or information
    def new
        # no need for functionality because all we want to do is render a new user page
        # this page that is rendered is a new user form that has method post to users
        # http://localhost:3000/users/new
        # new_user: PATH NAME
        # users#new: FROM CONTROLLER
    end
    def create
        user = User.create(user_params)
        if user.valid?
            session[:user_id] = user.id
            return redirect_to new_idea_path
            #READ THIS: change the "user_path" to something else
        end
        flash[:errors] = user.errors.full_messages
        return redirect_to :back
        # when creting a user or other model/ you do not need the @ sign before initialization, only use the @ sign when you need to display information on the page that you want to render/redirect to 
        # should return to the secrets page with all the secrets
        # http://localhost:3000/users/new
        # users: PATH NAME
        # users#create: FROM CONTROLLER
    end
    def show
        @user = User.find(params[:id])
        # user: PATH NAME
        # users#show: FROM CONTROLLER
    end
    def edit
        @user = User.find(params[:id])
        # edit_user: PATH NAME
        # users#edit: FROM CONTROLLER
    end
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path
        # NO PATH NAME BECAUSE ALL THIS DOES IS UPDATE
        # users#update: FROM CONTROLLER
    end
    def destroy
        user = User.find(params[:id])
        user.destroy
        reset_session
        redirect_to new_user_path
        # users#destroy: FROM CONTROLLER
        # NO PATH NAME BECAUSE ALL THIS DOES IS DESTROY
    end
    private
        def require_correct_user
            if current_user != User.find(params[:id])
            redirect_to "/users/#{session[:user_id]}"
            end
        end
        # user strong parameters for mass assignment only
        def user_params
            params.require(:user).permit(:first_name, :last_name, :alias, :email, :password, :password_confirmation)
        end
    # end of private methods
end
