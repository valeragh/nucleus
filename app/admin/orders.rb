ActiveAdmin.register Order do

  permit_params :status
  
  filter :id
  filter :status, as: :select, collection: Order::STATUS_TYPES
  actions :all, :except => [:new, :create]

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: Order::STATUS_TYPES
    end
    f.actions
  end

  index do
    column :id
    column :status
    column :total
    column :created_at
    actions
  end

  show title: :id do
    panel "Товар" do
      table_for order.order_items do
        column("Товар") do |order_item|
          order_item.product.present? ? (link_to order_item.product.title, [:admin, order_item.product]) : "Нет в системе"
        end
        column("Количество") do |order_item|
          order_item.quantity
        end
        column("Стоимость") do |order_item|
          order_item.unit_price
        end
        column("Итого") do |order_item|
          order_item.total_price
        end
      end     
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for order do
      row :id
      row :status
      row :total
      row :created_at
      row :updated_at
    end
  end

end
