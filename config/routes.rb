Rails.application.routes.draw do
  
  root 'static_pages#index'

  match '/contacts', to: 'static_pages#contacts', via: 'get'
  match '/about_us', to: 'static_pages#about_us', via: 'get'
  match '/faqs', to: 'static_pages#faqs', via: 'get'
  get   '/:id', to: 'stores#category', as: :show_category
  get '/:category_id/:id', to: 'stores#pod_category', as: :show_pod_category
  get 'stores/product'

end
