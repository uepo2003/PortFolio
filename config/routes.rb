Rails.application.routes.draw do
  
  devise_for :users
  resources  :lists
  
  get '/', to: 'homes#top', as: 'top'
  get 'homes/about', to: 'homes#about', as: 'about'
  get 'search', to: 'searches#search'
  get 'searches/search'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
