ActiveAdmin.register Contact do

  permit_params :latitude, :phone_one, :phone_two, :longitude, :address, :title, :phone, :image_url, :status, :description
  config.filters = false

  menu :priority => 3
  actions :all

  form do |f|
  	f.inputs 'Названия магазина' do
      f.input :title
    end
    f.inputs 'Адрес' do
      f.input :address, palceholder: "Скопировать с Google map", :hint => "Скопировать с Google map"
    end
    f.inputs 'Телефон' do
      f.input :phone_one
    end
    f.inputs 'Телефон два' do
      f.input :phone_two
    end
    f.inputs 'Описание магазина' do
      f.input :description
    end
    f.inputs 'Статус' do
      f.input :status, as: :select, collection: Contact::STATUS_TYPES
    end
    f.inputs 'Изображение минимум 500х500рх', :multipart => true do
      f.input :image_url, :hint => image_tag(object.image_url.url(:thumb))
    end
    actions
  end

  index do
  	column("Изображение"){|contact| image_tag contact.image_url.thumb}
    column :address
    column("Описание"){|contact| contact.description.truncate_words(8)}
    column("Телефоны"){|contact| contact.phones}
    column :title
    tag_column :status, interactive: true
    actions
  end

  show do
    panel "Данные" do
      attributes_table_for contact do
        row :description
        row("Сообщение"){|b| image_tag contact.image_url.magazine }
      end
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for contact do
      row :title
      row :address
      row("Телефоны"){|b| contact.phones}
      tag_row :status, interactive: true
    end
  end

end
