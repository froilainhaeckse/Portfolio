Rails.application.routes.draw do
  resources :records, except: [:show]
  get 'record/:id', to: 'records#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
