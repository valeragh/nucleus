ActiveAdmin.register Post do
  
  permit_params :title, :description, :image_url, :shot_description

  before_filter :find_resource, :only => [:show, :edit, :update, :destroy]

  filter :title

  show title: :title do
    panel "Данные" do
      attributes_table_for post do
        row :shot_description
        row("Описание"){|post| post.description.html_safe}
      end
    end
    active_admin_comments
  end

  sidebar "Детали", only: :show do
    attributes_table_for post do
      row('Изображение') do
        image_tag post.image_url.thumb
      end
      row :title
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :title, :hint => "До 6 слов"
    end
    f.inputs do
      f.input :shot_description, :hint => "До 30 слов"
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
    column("Изображение"){|post| image_tag post.image_url.thumb }
    column :title
    column :shot_description
    column :created_at
    actions
  end

end
