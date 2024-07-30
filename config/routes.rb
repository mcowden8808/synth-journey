Rails.application.routes.draw do
  get 'audio_entries/index'
  get 'audio_entries/show'
  get 'audio_entries/new'
  get 'audio_entries/create'
  get 'audio_entries/edit'
  get 'audio_entries/update'
  get 'audio_entries/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :audio_entries
  root 'audio_entries#index'
end
