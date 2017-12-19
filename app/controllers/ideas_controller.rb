class IdeasController < ApplicationController
    def new
        # loads the bright_ideas page with all the ideas
        # @user = User.find_by_id(params[:id])
        @user = User.find(params[:id] = current_user)
        @ideas = Idea.all
    end

    def create
        idea = Idea.new idea_params
        unless idea.save
            flash[:errors] = idea.errors.full_messages
        end
        redirect_to new_idea_path
    end

    def destroy
        @idea = Idea.find(params[:id])
        if @idea.user === current_user
            @idea.destroy
        end
        redirect_to new_idea_path
    end

    def show
        @idea = Idea.find(params[:id])
        @users = User.joins(:ideas_liked)
                     .select('users.*, count(ideas.id) as idea_count')
                     .where("likes.idea_id = #{@idea.id}")
                     .group(:id)
        @user = User.find(session[:user_id])
        @likes = Like.all.group(:id)
    end

    private
        def idea_params
            params.require(:idea).permit(:content).merge(user: current_user)
        end
    #end of private method
end


# <h4>People who liked this post:</h4>
#     <table>
#         <thead>
#             <tr>Alias:__________</tr>
#             <tr>Name:</tr>
#         </thead>
        
#         <tbody>
#             <% @likes.each do |like| if like.idea_id == @idea.id %>
#                 <tr >
#                     <td style="border-left: 2px solid black; border-top: 2px solid black;"><a href="/users/<%= @idea.user.id %>"> <%= like.user.alias %> </a></td>
#                     <td style="border-left: 2px solid black; border-top: 2px solid black;"> <%= like.user.first_name %> <%= like.user.last_name %> </td>
#                 </tr>
#             <% end %>
#             <% end %>
#         </tbody>
#     </table>