# Logjam::Application.routes.draw do
#   match ':controller/:action' => '#index', :as => :auto_complete, :via => 'get', :constraints => 'action(?-mix:auto_complete_for_\S+)'
#   match ':year/:month/:day/:action' => 'controller_actions#index', :constraints => 'day(?-mix:\d\d)month(?-mix:\d\d)year(?-mix:\d\d\d\d)'
#   match '/' => 'controller_actions#index'
#   match '/:controller(/:action(/:id))'
# end

ActionController::Routing::Routes.draw do |map|
  map.auto_complete ':controller/:action', 
                    :requirements => { :action => /auto_complete_for_\S+/ },
                    :conditions => { :method => :get }
  #  map.resources :controller_actions, :collection => {:filter => :post}

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  map.connect ':year/:month/:day/:action', :controller => "controller_actions",
     :requirements => {:year => /\d\d\d\d/, :month => /\d\d/, :day => /\d\d/}


  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "controller_actions", :action => "index"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
