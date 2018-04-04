ActiveAdmin.register PodCategory do

  permit_params :title, :rang, :category_id, :image_url, :slug
  before_filter :find_resource, :only => [:show, :edit, :update, :destroy]

  filter :title
  filter :category_id, label: 'Категория', as: :select, collection: proc { Category.find(PodCategory.pluck(:category_id)).map { |m| [m.title, m.id] } }

  form do |f|
    f.inputs do
      f.input :title
    end
    f.inputs do
      f.input :rang
    end
    f.inputs do
      f.input :category_id, as: :select, collection: Category.all.map { |m| [m.title, m.id] }
    end
    f.inputs 'Изображение минимум 500х500рх', :multipart => true do
      f.input :image_url, :hint => image_tag(object.image_url.url(:thumb))
    end
    f.actions
  end

  index do
  	column("Изображение"){|pod_category| image_tag pod_category.image_url.thumb}
  	column("Категория"){|pod_category| link_to pod_category.category.title, [:admin, pod_category.category]}
    column :title
    column :rang
    column :created_at
    actions
  end

  show title: :title do
    panel "Товары" do
      table_for pod_category.products do
        column do |product|
          image_tag product.image_url.thumb
        end
        column do |product|
          link_to product.title, [ :admin, product ]
        end
      end     
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for pod_category do
      row('Изображение') do
        image_tag pod_category.image_url.thumb
      end
      row('Категория') { |b| link_to pod_category.category.title, [:admin, pod_category.category] }
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
