Rails.application.routes.draw do
  
  resources :products, only: [:index] do
    resources :reviews, only: [:index, :show, :new, :create]
  end

  root 'static_pages#index'

  match '/contacts', to: 'static_pages#contacts', via: 'get'
  match '/about_us', to: 'static_pages#about_us', via: 'get'
  match '/faqs', to: 'static_pages#faqs', via: 'get'
  match '/reviews', to: 'reviews#all_reviews', via: 'get'
  get '/:id', to: 'stores#category', as: :show_category
  get '/:category_id/:id', to: 'stores#pod_category', as: :show_pod_category
  get '/:category_id/:pod_category_id/:id', to: 'stores#product', as: :show_product
end
