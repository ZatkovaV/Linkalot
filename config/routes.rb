Rails.application.routes.draw do
  resources :votes
  resources :links
  resources :study_groups

  root 'study_groups#index'

end
