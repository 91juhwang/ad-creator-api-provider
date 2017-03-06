Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope module: 'api', as: 'api' do
    namespace :v1 do
      resources :ads, only: [:create]
    end
  end
end
