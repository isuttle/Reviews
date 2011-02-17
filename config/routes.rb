Reviews::Application.routes.draw do
  get "home/contact"
  get "home/about"
  get "home/index"

  resources :review_votes

  resources :reviews

  resources :review_types

  resources :entities

  resources :apps
  
  #This will create foreign_review_path and foreign_review_url as named helpers in your application.
  match "reviews/:app_id/:foreign_id" => "reviews#index_by_ref", :as => :foreign_review, :via => :get

  #This will create foreign_entity_path and foreign_entity_url as named helpers in your application.
  match "entities/:app_id/:foreign_id" => "entities#show_by_ref", :as => :foreign_entity, :via => :get

  root :to => 'home#index'
end
