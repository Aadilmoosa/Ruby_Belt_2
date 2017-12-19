class LikesController < ApplicationController
    def create
        Like.create like_params
        redirect_to new_idea_path
        # idea_path idea.id
    end

    def destroy
        @like = Like.find(params[:id])
        if @like.user === current_user
            @like.destroy
        end
        redirect_to new_idea_path
        # idea_path idea.id
        # /like/<%= like.where(user: current_user, idea: idea).first.id%>
        # this path does not work to unlike something
    end

    private
        def like_params
        params.require(:like).permit(:idea_id).merge(user: current_user)
        end
end