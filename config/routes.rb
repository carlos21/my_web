MyWeb::Application.routes.draw do
  root :to => "Main#index", :as => 'root'
  #root :to => "chat#new", :as => 'root'

  match 'guides/:category_path' => 'main#article_list', :as => 'guides'
  match 'guides/:category_path/:article_path' => 'main#article_content', :as => 'guides_category_and_article'
  match 'comment/create' => 'main#create_comment', :as => 'create_comment'
  match 'change_language/:language' => 'main#change_language', :as => 'change_language'
  match 'rating/change_rating' => 'rating#change_rating', :as => 'change_rating'
  match 'chat/post_message' => 'chat#post_message', :as => 'post_message'
  match 'chat/typing_status' => 'chat#typing_status', :as => 'typing_status'
  match 'chat/change_nickname' => 'chat#change_nickname', :as => 'change_nickname'
  
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
