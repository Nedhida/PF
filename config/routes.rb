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

	post 'records/graphs_month(/:name)' => 'records#graphs_month'
  post 'records/income_day(/:name)' => 'records#income_day'
	post 'records/fixedcost_day(/:name)' => 'records#fixedcost_day'
	get 'records/variablecost_day' => 'records#variablecost_day'
	get 'records/month' => 'records#month'
	post 'records/day(/:name)' => 'records#day'
	post 'records/graph_month(/:name)' => 'records#graph_month'
	post 'records/graph_year(/:name)' => 'records#graph_year'

end
