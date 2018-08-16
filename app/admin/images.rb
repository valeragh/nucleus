ActiveAdmin.register Image do
  permit_params :image_url
  actions :all, :except => [:show]
  filter :image_url

  index do
    selectable_column
    column("Изображение"){|image| image_tag image.image_url.thumb }
    column :image_url_identifier
    column :created_at
    actions
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs do
      f.input :image_url, as: :file
    end
    f.actions
  end

end
