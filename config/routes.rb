# == Route Map
#
#                            Prefix Verb   URI Pattern                                  Controller#Action
#                        admin_root GET    /admin(.:format)                             admin/dashboard#index
#        batch_action_admin_reviews POST   /admin/reviews/batch_action(.:format)        admin/reviews#batch_action
#                     admin_reviews GET    /admin/reviews(.:format)                     admin/reviews#index
#                                   POST   /admin/reviews(.:format)                     admin/reviews#create
#                  new_admin_review GET    /admin/reviews/new(.:format)                 admin/reviews#new
#                 edit_admin_review GET    /admin/reviews/:id/edit(.:format)            admin/reviews#edit
#                      admin_review GET    /admin/reviews/:id(.:format)                 admin/reviews#show
#                                   PATCH  /admin/reviews/:id(.:format)                 admin/reviews#update
#                                   PUT    /admin/reviews/:id(.:format)                 admin/reviews#update
#                                   DELETE /admin/reviews/:id(.:format)                 admin/reviews#destroy
#  batch_action_admin_data_products POST   /admin/data_products/batch_action(.:format)  admin/data_products#batch_action
#               admin_data_products GET    /admin/data_products(.:format)               admin/data_products#index
#                                   POST   /admin/data_products(.:format)               admin/data_products#create
#           edit_admin_data_product GET    /admin/data_products/:id/edit(.:format)      admin/data_products#edit
#                admin_data_product PATCH  /admin/data_products/:id(.:format)           admin/data_products#update
#                                   PUT    /admin/data_products/:id(.:format)           admin/data_products#update
#        batch_action_admin_letters POST   /admin/letters/batch_action(.:format)        admin/letters#batch_action
#                     admin_letters GET    /admin/letters(.:format)                     admin/letters#index
#                 edit_admin_letter GET    /admin/letters/:id/edit(.:format)            admin/letters#edit
#                      admin_letter GET    /admin/letters/:id(.:format)                 admin/letters#show
#                                   PATCH  /admin/letters/:id(.:format)                 admin/letters#update
#                                   PUT    /admin/letters/:id(.:format)                 admin/letters#update
#                                   DELETE /admin/letters/:id(.:format)                 admin/letters#destroy
#         batch_action_admin_prices POST   /admin/prices/batch_action(.:format)         admin/prices#batch_action
#                      admin_prices GET    /admin/prices(.:format)                      admin/prices#index
#                                   POST   /admin/prices(.:format)                      admin/prices#create
#                  edit_admin_price GET    /admin/prices/:id/edit(.:format)             admin/prices#edit
#                       admin_price PATCH  /admin/prices/:id(.:format)                  admin/prices#update
#                                   PUT    /admin/prices/:id(.:format)                  admin/prices#update
#                   admin_dashboard GET    /admin/dashboard(.:format)                   admin/dashboard#index
#     batch_action_admin_categories POST   /admin/categories/batch_action(.:format)     admin/categories#batch_action
#                  admin_categories GET    /admin/categories(.:format)                  admin/categories#index
#                                   POST   /admin/categories(.:format)                  admin/categories#create
#                new_admin_category GET    /admin/categories/new(.:format)              admin/categories#new
#               edit_admin_category GET    /admin/categories/:id/edit(.:format)         admin/categories#edit
#                    admin_category GET    /admin/categories/:id(.:format)              admin/categories#show
#                                   PATCH  /admin/categories/:id(.:format)              admin/categories#update
#                                   PUT    /admin/categories/:id(.:format)              admin/categories#update
#                                   DELETE /admin/categories/:id(.:format)              admin/categories#destroy
#          batch_action_admin_users POST   /admin/users/batch_action(.:format)          admin/users#batch_action
#                       admin_users GET    /admin/users(.:format)                       admin/users#index
#                                   POST   /admin/users(.:format)                       admin/users#create
#                    new_admin_user GET    /admin/users/new(.:format)                   admin/users#new
#                   edit_admin_user GET    /admin/users/:id/edit(.:format)              admin/users#edit
#                        admin_user GET    /admin/users/:id(.:format)                   admin/users#show
#                                   PATCH  /admin/users/:id(.:format)                   admin/users#update
#                                   PUT    /admin/users/:id(.:format)                   admin/users#update
#                                   DELETE /admin/users/:id(.:format)                   admin/users#destroy
#         batch_action_admin_orders POST   /admin/orders/batch_action(.:format)         admin/orders#batch_action
#                      admin_orders GET    /admin/orders(.:format)                      admin/orders#index
#                  edit_admin_order GET    /admin/orders/:id/edit(.:format)             admin/orders#edit
#                       admin_order GET    /admin/orders/:id(.:format)                  admin/orders#show
#                                   PATCH  /admin/orders/:id(.:format)                  admin/orders#update
#                                   PUT    /admin/orders/:id(.:format)                  admin/orders#update
#                                   DELETE /admin/orders/:id(.:format)                  admin/orders#destroy
#       batch_action_admin_products POST   /admin/products/batch_action(.:format)       admin/products#batch_action
#                    admin_products GET    /admin/products(.:format)                    admin/products#index
#                                   POST   /admin/products(.:format)                    admin/products#create
#                 new_admin_product GET    /admin/products/new(.:format)                admin/products#new
#                edit_admin_product GET    /admin/products/:id/edit(.:format)           admin/products#edit
#                     admin_product GET    /admin/products/:id(.:format)                admin/products#show
#                                   PATCH  /admin/products/:id(.:format)                admin/products#update
#                                   PUT    /admin/products/:id(.:format)                admin/products#update
#                                   DELETE /admin/products/:id(.:format)                admin/products#destroy
# batch_action_admin_pod_categories POST   /admin/pod_categories/batch_action(.:format) admin/pod_categories#batch_action
#              admin_pod_categories GET    /admin/pod_categories(.:format)              admin/pod_categories#index
#                                   POST   /admin/pod_categories(.:format)              admin/pod_categories#create
#            new_admin_pod_category GET    /admin/pod_categories/new(.:format)          admin/pod_categories#new
#           edit_admin_pod_category GET    /admin/pod_categories/:id/edit(.:format)     admin/pod_categories#edit
#                admin_pod_category GET    /admin/pod_categories/:id(.:format)          admin/pod_categories#show
#                                   PATCH  /admin/pod_categories/:id(.:format)          admin/pod_categories#update
#                                   PUT    /admin/pod_categories/:id(.:format)          admin/pod_categories#update
#                                   DELETE /admin/pod_categories/:id(.:format)          admin/pod_categories#destroy
#                    admin_comments GET    /admin/comments(.:format)                    admin/comments#index
#                                   POST   /admin/comments(.:format)                    admin/comments#create
#                     admin_comment GET    /admin/comments/:id(.:format)                admin/comments#show
#                                   DELETE /admin/comments/:id(.:format)                admin/comments#destroy
#                  new_user_session GET    /login(.:format)                             users/sessions#new
#                      user_session POST   /login(.:format)                             users/sessions#create
#              destroy_user_session GET    /logout(.:format)                            users/sessions#destroy
#                     user_password POST   /password(.:format)                          users/passwords#create
#                 new_user_password GET    /password/new(.:format)                      users/passwords#new
#                edit_user_password GET    /password/edit(.:format)                     users/passwords#edit
#                                   PATCH  /password(.:format)                          users/passwords#update
#                                   PUT    /password(.:format)                          users/passwords#update
#          cancel_user_registration GET    /cancel(.:format)                            users/registrations#cancel
#                 user_registration POST   /                                            users/registrations#create
#             new_user_registration GET    /signup(.:format)                            users/registrations#new
#            edit_user_registration GET    /edit(.:format)                              users/registrations#edit
#                                   PATCH  /                                            users/registrations#update
#                                   PUT    /                                            users/registrations#update
#                                   DELETE /                                            users/registrations#destroy
#                   product_reviews GET    /products/:product_id/reviews(.:format)      reviews#index
#                                   POST   /products/:product_id/reviews(.:format)      reviews#create
#                new_product_review GET    /products/:product_id/reviews/new(.:format)  reviews#new
#                    product_review GET    /products/:product_id/reviews/:id(.:format)  reviews#show
#                          products GET    /products(.:format)                          products#index
#                           letters POST   /letters(.:format)                           letters#create
#                        new_letter GET    /letters/new(.:format)                       letters#new
#                       back_phones POST   /back_phones(.:format)                       back_phones#create
#                    new_back_phone GET    /back_phones/new(.:format)                   back_phones#new
#                              cart GET    /cart(.:format)                              carts#show
#                       order_items POST   /order_items(.:format)                       order_items#create
#                        order_item PATCH  /order_items/:id(.:format)                   order_items#update
#                                   PUT    /order_items/:id(.:format)                   order_items#update
#                                   DELETE /order_items/:id(.:format)                   order_items#destroy
#                            orders POST   /orders(.:format)                            orders#create
#                         new_order GET    /orders/new(.:format)                        orders#new
#                             order GET    /orders/:id(.:format)                        orders#show
#              liqpay_payment_order POST   /orders/:id/liqpay_payment(.:format)         payments#liqpay_payment
#                                   POST   /orders(.:format)                            orders#create
#                              root GET    /                                            static_pages#index
#                          contacts GET    /contacts(.:format)                          static_pages#contacts
#                          about_us GET    /about_us(.:format)                          static_pages#about_us
#                              faqs GET    /faqs(.:format)                              static_pages#faqs
#                           reviews GET    /reviews(.:format)                           reviews#all_reviews
#                             posts GET    /posts(.:format)                             posts#index
#                           cabinet GET    /cabinet(.:format)                           cabinets#show
#                            search GET    /search(.:format)                            stores#search
#                     show_category GET    /:id(.:format)                               stores#category
#                 show_pod_category GET    /:category_id/:id(.:format)                  stores#pod_category
#                      show_product GET    /:category_id/:pod_category_id/:id(.:format) stores#product
#                         show_post GET    /:id(.:format)                               posts#show
# 

Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users,
             controllers: {sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations'},
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  resources :products, only: [:index] do
    resources :reviews, only: [:index, :show, :new, :create]
    collection do
      post :import
      post :price_import
    end
  end
  resource :user, only: [:show] do
    collection do
      patch 'update_password'
    end
  end
  resources :letters, only: [:new, :create]
  resources :back_phones, only: [:new, :create]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, only: [:new, :create, :show]
  resources :orders, :only => [:create], :shallow => true do
    member do
      post '/liqpay_payment' => 'payments#liqpay_payment'
    end
  end

  root 'static_pages#index'

  match '/contacts', to: 'static_pages#contacts', via: 'get'
  match '/about_us', to: 'static_pages#about_us', via: 'get'
  match '/faqs', to: 'static_pages#faqs', via: 'get'
  match '/reviews', to: 'reviews#all_reviews', via: 'get'
  match '/posts', to: 'posts#index', via: 'get'
  match '/cabinet', to: 'cabinets#show', via: 'get'
  match '/search', to: 'stores#search', via: 'get'
  match '/terms_of_use', to: 'static_pages#terms_of_use', via: 'get'
  match '/privacy_policy', to: 'static_pages#privacy_policy', via: 'get'
  match '/sitemap_html', to: 'static_pages#sitemap_html', via: 'get'
  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all

  get '/robots.:format' => 'static_pages#robots'
  get '/sitemap.xml' => 'static_pages#sitemap', format: :xml, as: :sitemap, controller: 'static_pages', action: 'sitemap'
  get '/:id', to: 'stores#category', as: :show_category
  get '/:category_id/:id', to: 'stores#pod_category', as: :show_pod_category
  get '/:category_id/:pod_category_id/:id', to: 'stores#product', as: :show_product
  get '/:id', to: 'posts#show', as: :show_post
end
