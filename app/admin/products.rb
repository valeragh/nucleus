ActiveAdmin.register Product do

  permit_params :title, :rang, :price, :category_id, :pod_category_id, :description, :image_url, :slug
  before_filter :find_resource, :only => [:show, :edit, :update, :destroy]

  filter :title
  filter :status, as: :select, collection: Product::STATUS_TYPES
  filter :category_id, label: 'Категория', as: :select, collection: proc { Category.find(PodCategory.pluck(:category_id)).map { |m| [m.title, m.id] } }
  filter :pod_category_id, label: 'Подкатегория', as: :select, collection: proc { PodCategory.find(Product.pluck(:pod_category_id)).map { |m| [m.title, m.id] } }

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: Product::STATUS_TYPES
    end
    f.inputs do
      f.input :pod_category_id, as: :select, collection: PodCategory.all.map { |m| [m.title, m.id] }
    end
    f.inputs do
      f.input :title
    end
    f.inputs do
      f.input :price
    end
    f.inputs do
      f.input :rang
    end
    f.inputs do
      f.input :description
    end
    f.inputs 'Изображение минимум 500х500рх', :multipart => true do
      f.input :image_url, :hint => image_tag(object.image_url.url(:thumb))
    end
    f.actions
  end

  index do
  	column("Изображение"){|product| image_tag product.image_url.thumb}
  	column("Категория"){|product| link_to product.category.title, [:admin, product.category]}
  	column("Подкатегория"){|product| link_to product.pod_category.title, [:admin, product.pod_category]}
    column :title
    column :price
    column :rang
    column :created_at
    actions
  end

  show title: :title do
    panel "Отзывы" do
      table_for product.reviews do
        column do |review|
          link_to review.name, [ :admin, review ]
        end
        column do |review|
          review.description
        end
      end     
    end
    panel "Заказы" do
      table_for product.order_items.where.not('order_id' => nil) do
        column("Статус") do |order_item|
          order_item.order.status
        end
        column("Номер заказа") do |order_item|
          link_to order_item.order.id, [ :admin, order_item.order ]
        end
      end     
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for product do
      row('Изображение') do
        image_tag product.image_url.thumb
      end
      row('Категория') { |b| link_to product.category.title, [:admin, product.category] }
      row('Подкатегория') { |b| link_to product.pod_category.title, [:admin, product.pod_category] }
      row :status
      row :title
      row :price
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
