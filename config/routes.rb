Rails.application.routes.draw do
  root 'welcome#index'
  # root 'user#index1'

  devise_for :users
  get 'users/:id' => 'users#show', as: 'users_show'
  get 'users'=> 'users#index'

  
  get 'addfriend/:id' => 'friendship#friend_request', as: 'add_friend'

  get 'requests' => 'friendship#pending_request', as: 'pending_request'

  get 'friends' => 'friendship#friends', as: 'friends'
 
  get 'accecpt_request/:id' => 'friendship#friend_request_accept' , as: 'accecpt_request'

  delete 'reject_request/:id' => 'friendship#friend_request_reject' , as: 'reject_request'

  get 'like/:id' => 'users#like' , as: 'like_unlike' 

  # get 'users/like' => 'users#like'

  resources :microposts,          only: [:index, :create, :destroy]
  # resources :friendship do
  #  member do
  #    put 'friend_request' 
  #    put 'friend_request_accept'
  #    delete 'friend_request_reject'
  #   end 
  # end

 
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    

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
