ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do

    columns do

      column do
        panel "Заказы" do
          table_for Order.order(created_at: :desc).limit(10) do
            column("Дата создания"){|order| link_to (l order.created_at, format: :long), [:admin, order]}
            column :id
            column :status
            column :total
          end
        end

        panel "Письма" do
          table_for Letter.order(created_at: :desc).limit(10) do
            column("Дата создания"){|letter| link_to (l letter.created_at, format: :long), [:admin, letter]}
            column("Имя"){|letter| letter.name }
            column("Email"){|letter| letter.email}
            column("Сообщение"){|letter| letter.description}
            column("Статус"){|letter| status_tag(letter.status)}
          end
        end

        panel "Отзывы" do
          table_for Review.order(created_at: :desc).limit(10) do
            column("Дата создания"){|review| link_to (l review.created_at, format: :long), [:admin, review]}
            column("Товар"){|review| link_to review.product.title, [:admin, review.product]}
            column :name
            column :description
            column :status
          end
        end

      end

    end
  end # content
end
