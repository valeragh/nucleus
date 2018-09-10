ActiveAdmin.register Service do
  
  permit_params :title, :description, :image_url, :status

  before_filter :find_resource, :only => [:show, :edit, :update, :destroy]

  filter :title

  show title: :title do
    panel "Данные" do
      attributes_table_for service do
        row("Описание"){|service| service.description.html_safe}
      end
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for service do
      row('Изображение') do
        image_tag service.image_url.thumb
      end
      row :title
      tag_row :status, interactive: true
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :hint => "До 6 слов"
    end
    f.inputs do
      f.input :description, as: :trumbowyg
    end
    f.inputs 'Изображение минимум 600х400рх', :multipart => true do
      f.input :image_url, :hint => image_tag(object.image_url.url(:thumb))
    end
    f.actions
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

  index do
    column("Изображение"){|service| image_tag service.image_url.thumb }
    column :title
    column("Описание"){|service| service.description.truncate_words(8)}
    tag_column :status, interactive: true
    column :created_at
    column :updated_at
    actions
  end

end
