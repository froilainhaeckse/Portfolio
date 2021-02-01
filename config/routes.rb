Rails.application.routes.draw do
  resources :records, except: [:show]
  get 'record/:id', to: 'records#show', as: 'portfolio_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'
  
  resources :blogs

  root to: 'pages#home'
end
