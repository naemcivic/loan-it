Rails.application.routes.draw do

  resources :incident_reports
  resources :groups
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # devise_for :users, :path_prefix => 'my'
  resources :users
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'devices#index'
  get '/brokendevices' => 'devices#brokendevices'
  resources :devices do
    resources :loans
    resources :incident_reports
  end

  #API
  namespace :api, defaults: { format: :json } do
    scope module: :v1,
              constraints: ApiConstraints.new(version: 1, default: true) do
      resources :users, only: [:index]
      resources :groups, only: [:index]
      resources :devices, only: [:index, :show, :create] do
        resources :loans, only: [:create, :update, :destroy]
      end
    end
  end

  # Devise json override both registrations and sessions controller
  devise_for :users, :controllers => { :registrations => "users/registrations",
                                        :sessions => "users/sessions"
                                      }




  #get '/loans', to: 'loans#index'

  #get '/devices/:id/loans', to: 'loans#new'

  #get '/loans/:id', to: 'loans#show'

  #get '/loans/:id/edit', to: 'loans#edit'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
