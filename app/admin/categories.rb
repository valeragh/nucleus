ActiveAdmin.register Category do

  permit_params :title, :rang, :image_url, :slug
  before_filter :find_resource, :only => [:show, :edit, :update, :destroy]

  filter :title

  form do |f|
    f.inputs do
      f.input :title
    end
    f.inputs do
      f.input :rang
    end
    f.inputs 'Изображение минимум 500х500рх', :multipart => true do
      f.input :image_url, :hint => image_tag(object.image_url.url(:thumb))
    end
    f.actions
  end

  index do
  	column("Изображение"){|category| image_tag category.image_url.thumb}
    column :title
    column :rang
    column :created_at
    actions
  end

  show title: :title do
    panel "Подкатегории" do
      table_for category.pod_categories do
        column do |pod_category|
          image_tag pod_category.image_url.thumb
        end
        column do |pod_category|
          link_to pod_category.title, [ :admin, pod_category ]
        end
      end     
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for category do
      row('Изображение') do
        image_tag category.image_url.thumb
      end
      row :title
      row :rang
      row :created_at
      row :updated_at
    end
  end

  controller do
    def find_resource
      begin
        scoped_collection.where(slug: params[:id]).first!
      rescue ActiveRecord::RecordNotFound
        scoped_collection.find(params[:id])
      end
    end
  end

end
