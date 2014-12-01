Rails.application.routes.draw do
  get 'about/show'

  get 'reservations/:id/find_matches' => 'reservations#find_matches', as: :find_matches
  #get 'rock_paper_scissors/(:guess)' => 'rock_paper_scissors#index', as: :rock_paper_scissors


  #get 'reservations/new'
  #get 'reservations/index'
  #get 'reservations/show'

  resources :reservations

  resources :messages

  devise_for :users, controllers: {omniauth_callbacks: :omniauth_callbacks}
  get 'contact/show', as: :contact
  get 'about/show', as: :about


  get 'login/show', as: :login

  get 'reservations/find_restaurants' => 'reservations#find_restaurants', as: :find_restaurants

  put 'reservations/:id/inactivate' => 'reservations#inactivate', as: :inactivate_reservation

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

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
