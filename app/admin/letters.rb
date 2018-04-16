ActiveAdmin.register Letter do
  
  permit_params :name, :email, :description, :checked_out_at

  config.per_page = 10

  menu :priority => 3
  actions :all, :except => [:new, :create]


  filter :created_at, label: 'Дата создания'
  filter :checked_out_at, label: 'Дата ответа'
  filter :name, label: 'Имя'
  filter :email, label: 'Email'


  scope "Все", :all, :default => true
  scope "Новый", :in_progress
  scope "Обработанный", :complete

  form do |f|
    f.inputs 'Дата ответа' do
      f.input :checked_out_at, as: :date_time_picker
    end
    actions
  end

  show do
    panel "Данные" do
      attributes_table_for letter do
        row('Дата создания') { |b| l letter.created_at, format: :short}
        row("Сообщение"){|b| letter.description}
        row("Статус"){|b| status_tag(letter.state)}
        if letter.checked_out_at?
          row('Дата ответа') { |b| l letter.checked_out_at, format: :short}
        else
          row('Дата ответа') { |b| letter.checked_out_at}
        end
      end
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for letter do
      row("Имя"){|b| letter.name}
      row("Email"){|b| letter.email}
    end
  end

  index do
    column("Дата создания"){|letter| l letter.created_at, format: :short}
    column :name 
    column :email
    column("Сообщение"){|letter| letter.description}
    column("Статус"){|letter| status_tag(letter.state)}
    actions
  end

end
