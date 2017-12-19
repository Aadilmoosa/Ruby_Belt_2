Rails.application.routes.draw do
  root 'application#index'
  resources :users, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :ideas, only: [:new, :create, :destroy, :show]
  resources :likes, only: [:create, :destroy]
end


# Prefix Verb   URI Pattern               Controller#Action
#             root                            'application#index'   #renders login/reg
#       users POST   /users(.:format)          users#create         #renders reg
#    new_user GET    /users/new(.:format)      users#new            #renders login
#   edit_user GET    /users/:id/edit(.:format) users#edit           #the edit method in controller
#        user GET    /users/:id(.:format)      users#show     #must be different for different projects
#             PATCH  /users/:id(.:format)      users#update
#             PUT    /users/:id(.:format)      users#update
#             DELETE /users/:id(.:format)      users#destroy

#    sessions POST   /sessions(.:format)       sessions#create      #create login session
# new_session GET    /sessions/new(.:format)   sessions#new         #renders login session page
#     session DELETE /sessions/:id(.:format)   sessions#destroy     #logout / destroy session

#     ideas POST   /ideas(.:format)          ideas#create         #create method in controller
#  new_idea GET    /ideas/new(.:format)      ideas#new            #renders the new idea page
#      idea GET    /ideas/:id(.:format)      ideas#show           #shows the Idea and all the people that liked it
#           DELETE /ideas/:id(.:format)      ideas#destroy        #destroy method in controller

#     likes POST   /likes(.:format)          likes#create
#      like DELETE /likes/:id(.:format)      likes#destroy