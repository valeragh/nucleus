ActiveAdmin.register Letter do
  
  permit_params :status

  config.per_page = 10

  menu :priority => 3
  actions :all, :except => [:new, :create]

  filter :created_at, label: 'Дата создания'
  filter :name, label: 'Имя'
  filter :email, label: 'Email'

  form do |f|
    f.inputs 'Статус' do
      f.input :status, as: :select, collection: Letter::STATUS_TYPES
    end
    actions
  end

  show do
    panel "Данные" do
      attributes_table_for letter do
        row('Дата создания') { |b| l letter.created_at, format: :short}
        row("Сообщение"){|b| letter.description}
      end
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for letter do
      row("Имя"){|b| letter.name}
      row("Email"){|b| letter.email}
      tag_row :status, interactive: true
    end
  end

  index do
    column("Дата создания"){|letter| l letter.created_at, format: :short}
    column :name 
    column :email
    column("Сообщение"){|letter| letter.description.truncate_words(8)}
    tag_column :status, interactive: true
    actions
  end

end
