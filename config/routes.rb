Senatest::Application.routes.draw do
  root :to => 'pages#index'

  resources :politicians, only: [:index, :show, :edit, :update] do
  end

  resources :states, only: [:index, :show]
  resources :parties, only: [:index, :show]
end
