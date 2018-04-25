ActiveAdmin.register DataProduct do
  permit_params :file_url
  
  actions :all, :except => [:new, :show, :destroy]
  config.filters = false 
  
  form do |f|
    f.inputs do
      f.input :file_url
    end
    f.actions
  end

  index do
    column :file_url
    column :updated_at
    actions
  end

end
