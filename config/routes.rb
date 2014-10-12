Mafia::Application.routes.draw do
    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"
    root 'game#client'

    # Example of regular route:
    #   get 'products/:id' => 'catalog#view'
    get 'start' =>'game#start_game'
    get 'join' => 'game#join'
    get 'reset'=>'game#reset'
    get 'players'=>'game#get_players'
    get 'begin'=>'game#has_game_started'
    get 'results'=>'game#vote_results'
    get 'playerhash'=>'game#get_player_hash'
    get 'vote'=>'game#vote'
    get 'dead'=>'game#get_dead_players'
    get 'mafia'=>'game#mafia_kill'
    get 'night'=>'game#is_night'
    get 'who'=>'game#who'
    get 'gameover'=>'game#gameover'
    get 'startnextround'=>'game#begin_next_round'
    get 'roundend'=> 'game#roundend'

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
