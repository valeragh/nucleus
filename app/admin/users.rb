ActiveAdmin.register User do
permit_params :email, :password, :password_confirmation, :role

  filter :email
  filter :role, label: 'Роль', as: :select, collection: {None: "none", Administrator: "admin", Manager: "manager" }

  form do |f|
    f.inputs 'Роль' do
      f.input :role, as: :radio, collection: {None: "none", Administrator: "admin", Manager: "manager" }
    end
    f.inputs 'Email' do
      f.input :email
    end
    f.inputs 'Пароль' do
      f.input :password
    end
    f.inputs 'Повторите пароль' do
      f.input :password_confirmation
    end
    f.actions
  end

  index do
    column :email
    #column("Дата текущего посещения"){|user| user.current_sign_in_at}
    #column("Дата последнего посещения"){|user| user.last_sign_in_at}
    column("Посещаемость"){|user| user.sign_in_count}
    column("Роль"){|user| user.role}
    actions
  end

  show title: :email do
    panel "Данные" do
      attributes_table_for user do
        row('Email') { |b| user.email}
        row('Роль') { |b| user.role}
        row('Посещаемость') { |b| user.sign_in_count}
        row('Текущая посещаемость') { |b| user.current_sign_in_at}
        row('Последняя посещаемость') { |b| user.last_sign_in_at}
        row('Текущий IP') { |b| user.current_sign_in_ip}
        row('Последний IP') { |b| user.last_sign_in_ip}
        row('Создано') { |b| user.created_at}
        row('Обновлено') { |b| user.updated_at}
      end
    end
    active_admin_comments
  end

   sidebar "Детали", only: :show do
    #table_for user.orders do
      #column("Заказы") do |order|
        #link_to order.product.title, [ :admin, order ]
      #end
      #column("Статус") do |order|
        #status_tag(order.status)
      #end
    #end
  end

  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete("password")
        params[:user].delete("password_confirmation")
      end
      super
    end
  end


end
