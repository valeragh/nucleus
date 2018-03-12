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

  root 'static_pages#index'

  match '/contacts', to: 'static_pages#contacts', via: 'get'
  match '/about_us', to: 'static_pages#about_us', via: 'get'
  match '/faqs', to: 'static_pages#faqs', via: 'get'
  match '/reviews', to: 'reviews#all_reviews', via: 'get'
  match '/posts', to: 'posts#index', via: 'get'
  get '/:id', to: 'posts#show', as: :show_post
  get '/:id', to: 'stores#category', as: :show_category
  get '/:category_id/:id', to: 'stores#pod_category', as: :show_pod_category
  get '/:category_id/:pod_category_id/:id', to: 'stores#product', as: :show_product
end
