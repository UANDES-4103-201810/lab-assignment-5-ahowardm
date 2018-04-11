Rails.application.routes.draw do
  get 'user_tickets/create'

  get 'user_tickets/update'

  get 'user_tickets/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :places
  resources :events
  resources :tickets
  resources :users

  resources :users do
    resources :user_tickets
  end
end
