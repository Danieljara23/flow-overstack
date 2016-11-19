Rails.application.routes.draw do

  #get 'comments/create'

  #get 'comments/update'

  #get 'comments/destroy'

  	devise_for :users
	resources :posts
	resources :comments

	root to: "posts#index"


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
