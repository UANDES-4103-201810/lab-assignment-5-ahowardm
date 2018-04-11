Rails.application.routes.draw do
  # get 'user_tickets/create'

  # get 'user_tickets/update'

  # get 'user_tickets/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :places
  resources :events
  resources :tickets
  resources :users

  resources :users do
    resources :user_tickets
  end

  get 'users/top_ten_clients' => 'user#top_ten_clients', as: 'top_ten'
  get 'events/most_tickets_bought' => 'event#most_tickets_bought_not_paid', as: 'most_tickets_bought'
  get 'events/:id/most_expensive_tickets' => 'tickets#most_expensive_tickets', as: 'most_expensive_tickets'
end
