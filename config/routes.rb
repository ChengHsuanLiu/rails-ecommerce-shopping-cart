Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: "omniauth_callbacks" }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):

  post 'admin/products/create_child_product' => 'admin/products#create_child_product'
  post 'admin/products/delete_child_product' => 'admin/products#delete_child_product'
  post 'admin/products/create_attribute' => 'admin/products#create_attribute'
  post 'admin/products/delete_attribute' => 'admin/products#delete_attribute'

  get 'admin/images/get_image_url' => 'admin/images#get_image_url'
  get 'admin/index' => 'admin/pages#index'

  namespace :admin do
    resources :products
    resources :product_categories
    resources :brands
    resources :orders
    resources :images
    resources :users
    resources :posts do
      resources :post_comments
    end
    resources :post_categories
  end

  resources :products do
    resources :product_attributes
    resources :product_comments
  end

  resources :user_cart_items
  post 'user_cart_items/update_all' => 'user_cart_items#update_all'
  resources :user_notifications
  resources :post_categories
  resources :posts do
    resources :post_comments
  end

  resources :orders
  resources :brands

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
