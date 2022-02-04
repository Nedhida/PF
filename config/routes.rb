Rails.application.routes.draw do

  devise_for :users
  root 'homes#top'
  get 'home/about' => 'homes#about'

    resources :users, only: [:index,:show, :edit, :update] do
      get "search", to: "users#search"
      resource :relationships, only: [:create, :destroy]
      member do
        get :following, :followers
      end
    end

  resources :posts do
    resource :comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end

  get '/search', to: 'searchs#search'

  resources :incomes, :fixedcosts, :variablecosts,
            :income_values, :fixedcost_values, :variablecost_values

  resources :records, only: [:show] do
    member do
      get :month
    end
  end

	resources :graphs, except: [:index,:show,:new,:edit,:create,:update,:destroy] do
  	member do
  	  get :income_year, :income_month, :income_show,
  	      :cost_year, :cost_month, :cost_show
  	end
	end

end
