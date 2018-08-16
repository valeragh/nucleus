require 'rails_helper'

RSpec.describe Admin::ImagesController, type: :controller do

  render_views
  let(:resource_class) { Image }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the image' do
      image = create(:image)
      get :index
      expect(assigns(:images)).to include(image)
    end
    it "should render the expected columns" do
      image = create(:image)
      get :index
      expect(page).to have_content(image.image_url_identifier)
    end
  end

  describe "GET new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the image' do
      get :new
      expect(assigns(:image)).to be_a_new(Image)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Изображение')
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Image" do
        @attr = { 
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg')))
        }
        expect {
          post :create, :image => @attr
        }.to change(Image, :count).by(1)
      end

      it "assigns a newly created image as @image" do
        @attr = { 
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg')))
        }
        post :create, :image => @attr
        expect(assigns(:image)).to be_a(Image)
        expect(assigns(:image)).to be_persisted
      end

      it "redirects to the created image" do
        @attr = { 
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg')))
        }
        post :create, :image => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_images_path)
      end

    end
  end


  describe "GET edit" do
    it 'returns http success' do
      image = create(:image)
      get :edit, id: image
      expect(response).to have_http_status(:success)
    end
    it 'assigns the image' do
      image = create(:image)
      get :edit, id: image
      expect(assigns(:image)).to eq(image)
    end
    it "should render the form elements" do
      image = create(:image)
      get :edit, id: image
      expect(page).to have_field('Изображение')
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the image' do
        image = create(:image)
        @attr = { :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg'))) }
        put :update, id: image, :image => @attr
        expect(assigns(:image)).to eq(image)
      end
      it 'returns http redirect' do
        image = create(:image)
        @attr = { :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/homemini.jpeg'))) }
        put :update, id: image, :image => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_images_path)
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        image = create(:image)
        @attr = { :image_url => '' }
        put :update, id: image, :image => @attr
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      image = create(:image)
      expect {
        delete :destroy, id: image
      }.to change(Image, :count).by(-1)
    end

    it "redirects to the field" do
      image = create(:image)
      delete :destroy, id: image
      expect(response).to redirect_to(admin_images_path)
    end
  end

  

end