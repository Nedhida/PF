Rails.application.routes.draw do
  
  root 'homes#top'
  get 'home/about' => 'homes#about'
  
  devise_for :users
    resources :users do
      #get "search", to: "users#search"
      resource :relationships, only: [:create, :destroy]
      member do
        get :following, :followers
      end
    end
    
  resources :posts do
    resource :comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end
  
  #get '/search', to: 'searchs#search'
  
  resources :incomes
	resources :fixedcosts
	resources :variablecosts
	resources :income_values
	resources :fixedcost_values
	resources :variablecost_values
end
