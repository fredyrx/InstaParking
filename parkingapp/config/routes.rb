Rails.application.routes.draw do
  
  devise_for :users
  get 'rentar/pagar'

  get 'account/login'

  get 'admin/index'

  # Sin login
  root 'home#index'
  get 'contacto' => 'home#contacto'
  get 'faq' => 'home#faq'
  get 'quienessomos' => 'home#quienessomos'
  get 'buscar' => 'buscar#index'
  get 'login' => 'account#login'
  get 'signup' => 'account#signup'
  
  # Con login
  get 'ofertar' => 'ofertar#index'
  get 'admin' => 'admin#index'
  get 'rentar' => 'rentar#pagar'
  get 'rentar/pagado' => 'rentar#pagado'
  get 'logout' => 'account#logout'
  
  
  get 'parking_lots/search' => 'parking_lots#search'
  get 'parking_lots/result' => 'parking_lots#result'
  get '/parking_lots/:id/rents' => 'parking_lots#rents'
  get '/parking_lots/sales' => 'parking_lots#sales'
  get '/parking_lots/district' => 'parking_lots#by_district'
  
  get 'rents/history' => 'rents#history'
  
  resources :districts
  resources :parking_lots
  resources :rents
  
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
