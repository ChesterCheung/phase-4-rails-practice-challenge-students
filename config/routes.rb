Rails.application.routes.draw do
  resources :students, only: [:create, :index, :update, :destroy, :show]
  resources :instructors, only: [:create, :index, :update, :destroy, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
