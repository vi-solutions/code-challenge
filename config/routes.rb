Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'application#index'

  namespace :api do
    namespace :v1 do
      namespace :health_services do
        get 'get_area_name'
      end
    end
  end
end
