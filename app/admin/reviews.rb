ActiveAdmin.register Review do
  
  permit_params :status, :name, :description, :product_id
  
  filter :product_id, label: 'Товар', as: :select, collection: proc { Product.find(Review.pluck(:product_id)).map { |m| [m.title, m.id] } }
  filter :status, as: :select, collection: Review::STATUS_TYPES

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: Review::STATUS_TYPES
    end
    f.inputs do
      f.input :product_id, as: :select, collection: Product.all
    end
    f.inputs do
      f.input :name
    end
    f.inputs do
      f.input :description
    end
    f.actions
  end

  index do
  	column("Товар"){|review| link_to review.product.title, [:admin, review.product]}
    column :name
    column :description
    column :status
    column :created_at
    actions
  end

  show title: :id do
    panel "Отзыв" do
      attributes_table_for review do
        row :name
        row :description
      end
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for review do
      row :status
      row :created_at
      row :updated_at
    end
  end

end
