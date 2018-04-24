ActiveAdmin.register Price do
  permit_params :price_url, :status
  
  actions :all, :except => [:new, :show, :destroy]
  config.filters = false 
  
  form do |f|
    f.inputs do
      f.input :price_url
    end
    f.actions
  end

  index do
    column :price_url
    column :updated_at
    column :status
    actions
  end
end
