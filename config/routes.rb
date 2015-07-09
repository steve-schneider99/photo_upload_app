Rails.application.routes.draw do
  devise_for :users

  resources :users do
    resources :pictures
  end

  resources :picture_lists

  root :to => "home#index"

end
