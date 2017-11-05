Rails.application.routes.draw do
  resources :stills_projects
  resources :motion_projects
  resources :projects
  resources :portfolios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
