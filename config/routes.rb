require 'sidekiq/web'
 
Rails.application.routes.draw do

  mount Sidekiq::Web, at: '/sidekiq'
  
  resources :participants
  resources :events do
    collection do
    end  
  end
  resources :import_sheets, only: [:new, :create, :index] do
    member do
      get :process_sheet
    end
  end
  
  root to: "import_sheets#index"
end
