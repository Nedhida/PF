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

  resources :posts, only: [:index, :show]

  resources :variablecost_values do
    resources :comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end

  get '/search', to: 'searchs#search'

  resources :incomes, :fixedcosts, :variablecosts,
            :income_values, :fixedcost_values, :variablecost_values


	resources :graphs, except: [:index,:show,:new,:edit,:create,:update,:destroy] do
  	member do
  	  get :income_year, :income_month, :income_show,
  	      :outgo_year, :outgo_month, :outgo_show
  	end
	end

  post 'records/income_day(/:name)' => 'records#income_day'
	post 'records/fixedcost_day(/:name)' => 'records#fixedcost_day'
	post 'records/variablecost_day(/:name)' => 'records#variablecost_day'
	get 'records/month' => 'records#month'
	post 'records/day(/:name)' => 'records#day'

end
