DemoApp::Application.routes.draw do |map|
  resources :users

  get "accounts/index"
  post "accounts/search"
  post "accounts/create"
  post "accounts/show_all"
  match "accounts/all", :to => "accounts#show_all"
  match "accounts/:id", :to => "accounts#show"
  match "accounts/:id/edit", :to => "accounts#edit"
  match "accounts/:id/save", :to => "accounts#save"
  match "accounts/:id/new_opp", :to => "accounts#new_opp"
  match "accounts/:id/save_opp", :to => "accounts#save_opp"

  post "partners/index"
  post "partners/new_partner"
  post "partners/save_partner"
  match "partners/new_partner", :to => "partners#new_partner"
  match "partners/index", :to => "partners#index"
  match "partners/:id", :to => "partners#show"
  match "partners/:id/edit", :to => "partners#edit"
  match "partners/:id/save", :to => "partners#save"
  
  post "sessions/create"
  
  #add our oauth redirect route - qw
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#fail'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'

  map.root :controller => 'application'
end
