Rails.application.routes.draw do
  resources :offers
  resources :courses
  resources :campuses
  resources :universities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
