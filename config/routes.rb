Rails.application.routes.draw do
  resources :images, except: [:show]
  resources :stills_projects, except: [:index, :show]
  resources :motion_projects, except: [:index, :show]
  
  get 'projects', to: 'projects#index'

  resources :portfolios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
