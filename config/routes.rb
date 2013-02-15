MyWeb::Application.routes.draw do
  root :to => "main#index", :as => 'root'
  match "/" => "main#index"
  match "/naves" => "main#naves"
  
  # about me
  match '/:locale/about-me' => 'main#about_me', :as => 'about_me'
  match '/about-me' => 'main#about_me', :as => 'about_me'

  #scope '(:locale)', :locale => /en|es/ do
  match '/:locale/guides/:category_path' => 'main#article_list', :as => 'guides'
  match '/:locale/guides/:category_path/:article_path' => 'main#article_content', :as => 'guides_category_and_article'
  #end

  match '/auth/:provider/callback', to: 'authorization#callback'

  # demo
  match '/:locale/demos/:article_path' => 'main#demo_content', :as => 'demo_content'  

  # comments
  match 'comment/create' => 'comment#create', :via => 'post', :as => 'create_comment'
  match 'comment/delete/:id' => 'comment#delete', :as => 'delete_comment'
  match 'change_language/:locale' => 'main#change_language', :as => 'change_language'

  # rating
  match 'rating/change_rating' => 'rating#change_rating', :as => 'change_rating'

  # chat
  match 'chat/post_message' => 'chat#post_message', :as => 'post_message'
  match 'chat/typing_status' => 'chat#typing_status', :as => 'typing_status'
  match 'chat/change_nickname' => 'chat#change_nickname', :as => 'change_nickname'

  # popup login to socialnetworks
  match 'show/socialnetworks' => 'main#show_socialnetworks_popup', :as => 'socialnetworks'

  # CV
  match "/:locale/cv" => "main#download_cv"
  match "/cv" => "main#download_cv"

  # omniauth
  match "/signout" => "sessions#destroy", :as => :signout
  match "/:locale" => "main#index"


  


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
