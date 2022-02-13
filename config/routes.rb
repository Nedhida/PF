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
            
  resources :records, only: [:show] do
    collection do
      get :income_day, :fixedcost_day, :variablecost_day, :month, :day,
          :graph_month, :graph_year
    end
  end

end
