# == Route Map
#
#                   Prefix Verb   URI Pattern                                  Controller#Action
#               admin_root GET    /admin(.:format)                             admin/dashboard#index
#          admin_dashboard GET    /admin/dashboard(.:format)                   admin/dashboard#index
# batch_action_admin_users POST   /admin/users/batch_action(.:format)          admin/users#batch_action
#              admin_users GET    /admin/users(.:format)                       admin/users#index
#                          POST   /admin/users(.:format)                       admin/users#create
#           new_admin_user GET    /admin/users/new(.:format)                   admin/users#new
#          edit_admin_user GET    /admin/users/:id/edit(.:format)              admin/users#edit
#               admin_user GET    /admin/users/:id(.:format)                   admin/users#show
#                          PATCH  /admin/users/:id(.:format)                   admin/users#update
#                          PUT    /admin/users/:id(.:format)                   admin/users#update
#                          DELETE /admin/users/:id(.:format)                   admin/users#destroy
#           admin_comments GET    /admin/comments(.:format)                    admin/comments#index
#                          POST   /admin/comments(.:format)                    admin/comments#create
#            admin_comment GET    /admin/comments/:id(.:format)                admin/comments#show
#                          DELETE /admin/comments/:id(.:format)                admin/comments#destroy
#         new_user_session GET    /login(.:format)                             users/sessions#new
#             user_session POST   /login(.:format)                             users/sessions#create
#     destroy_user_session GET    /logout(.:format)                            users/sessions#destroy
#            user_password POST   /password(.:format)                          users/passwords#create
#        new_user_password GET    /password/new(.:format)                      users/passwords#new
#       edit_user_password GET    /password/edit(.:format)                     users/passwords#edit
#                          PATCH  /password(.:format)                          users/passwords#update
#                          PUT    /password(.:format)                          users/passwords#update
# cancel_user_registration GET    /cancel(.:format)                            users/registrations#cancel
#        user_registration POST   /                                            users/registrations#create
#    new_user_registration GET    /signup(.:format)                            users/registrations#new
#   edit_user_registration GET    /edit(.:format)                              users/registrations#edit
#                          PATCH  /                                            users/registrations#update
#                          PUT    /                                            users/registrations#update
#                          DELETE /                                            users/registrations#destroy
#          product_reviews GET    /products/:product_id/reviews(.:format)      reviews#index
#                          POST   /products/:product_id/reviews(.:format)      reviews#create
#       new_product_review GET    /products/:product_id/reviews/new(.:format)  reviews#new
#           product_review GET    /products/:product_id/reviews/:id(.:format)  reviews#show
#                 products GET    /products(.:format)                          products#index
#                  letters POST   /letters(.:format)                           letters#create
#               new_letter GET    /letters/new(.:format)                       letters#new
#                     cart POST   /cart(.:format)                              carts#create
#                 new_cart GET    /cart/new(.:format)                          carts#new
#                          GET    /cart(.:format)                              carts#show
#              order_items POST   /order_items(.:format)                       order_items#create
#               order_item PATCH  /order_items/:id(.:format)                   order_items#update
#                          PUT    /order_items/:id(.:format)                   order_items#update
#                          DELETE /order_items/:id(.:format)                   order_items#destroy
#                   orders POST   /orders(.:format)                            orders#create
#                new_order GET    /orders/new(.:format)                        orders#new
#                    order GET    /orders/:id(.:format)                        orders#show
#     liqpay_payment_order POST   /orders/:id/liqpay_payment(.:format)         payments#liqpay_payment
#                          POST   /orders(.:format)                            orders#create
#                     root GET    /                                            static_pages#index
#                 contacts GET    /contacts(.:format)                          static_pages#contacts
#                 about_us GET    /about_us(.:format)                          static_pages#about_us
#                     faqs GET    /faqs(.:format)                              static_pages#faqs
#                  reviews GET    /reviews(.:format)                           reviews#all_reviews
#                    posts GET    /posts(.:format)                             posts#index
#            show_category GET    /:id(.:format)                               stores#category
#        show_pod_category GET    /:category_id/:id(.:format)                  stores#pod_category
#             show_product GET    /:category_id/:pod_category_id/:id(.:format) stores#product
#                show_post GET    /:id(.:format)                               posts#show
# 

Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users,
             controllers: {sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations'},
             path: '',
             path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'signup' }

  resources :products, only: [:index] do
    resources :reviews, only: [:index, :show, :new, :create]
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
  match 'cabinet', to: 'cabinets#show', via: 'get'
  get '/:id', to: 'stores#category', as: :show_category
  get '/:category_id/:id', to: 'stores#pod_category', as: :show_pod_category
  get '/:category_id/:pod_category_id/:id', to: 'stores#product', as: :show_product
  get '/:id', to: 'posts#show', as: :show_post
end
