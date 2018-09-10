require 'rails_helper'

RSpec.describe Admin::ServicesController, type: :controller do

  render_views
  let(:resource_class) { Service }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET #index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the service' do
      service = create(:service)
      get :index
      expect(assigns(:services)).to include(service)
    end
    it "should render the expected columns" do
      service = create(:service)
      get :index
      expect(page).to have_content(service.title)
      expect(page).to have_content(service.status)
      expect(page).to have_content(service.description)
    end
    let(:filters_sidebar) { page.find('#filters_sidebar_section') }
    it "filter Title exists" do
      get :index
      expect(filters_sidebar).to have_css('label[for="q_title"]', text: 'Заголовок')
      expect(filters_sidebar).to have_css('input[name="q[title_contains]"]')
    end
    it "filter Title works" do
      matching_service = create(:service, title: 'test')
      non_matching_service = create(:service, title: 'non')

      get :index, q: { title_cont: 'test' }

      expect(assigns(:services)).to include(matching_service)
      expect(assigns(:services)).not_to include(non_matching_service)
    end
  end

  describe "GET #new" do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
    it 'assigns the service' do
      get :new
      expect(assigns(:service)).to be_a_new(Service)
    end
    it "should render the form elements" do
      get :new
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Описание')
      expect(page).to have_field('Изображение')
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new Service" do
        @attr = { 
          :title => 'test',
          :description => 'test',
          :status => 'Показать',
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        expect {
          post :create, :service => @attr
        }.to change(Service, :count).by(1)
      end

      it "assigns a newly created service as @service" do
        @attr = { 
          :title => 'test',
          :description => 'test',
          :status => 'Показать',
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        post :create, :service => @attr
        expect(assigns(:service)).to be_a(Service)
        expect(assigns(:service)).to be_persisted
      end

      it "redirects to the created service" do
        @attr = { 
          :title => 'test',
          :description => 'test',
          :status => 'Показать',
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        post :create, :service => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_service_path(Service.last))
      end

      it 'should create the service' do
        @attr = { 
          :title => 'test',
          :description => 'test',
          :status => 'Показать',
          :image_url => Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/magazine_nucleus.jpg')))
        }
        post :create, :service => @attr
        service = Service.last

        expect(service.title).to  eq(@attr[:title])
        expect(service.description).to  eq(@attr[:description])
        expect(service.status).to  eq(@attr[:status])
      end
    end
  end

  describe "GET #edit" do
    it 'returns http success' do
      service = create(:service)
      get :edit, id: service
      expect(response).to have_http_status(:success)
    end
    it 'assigns the service' do
      service = create(:service)
      get :edit, id: service
      expect(assigns(:service)).to eq(service)
    end
    it "should render the form elements" do
      service = create(:service)
      get :edit, id: service
      expect(page).to have_field('Заголовок')
      expect(page).to have_field('Описание')
      expect(page).to have_field('Изображение')
    end
  end

  describe "PUT #update" do
    context 'with valid params' do
      it 'assigns the service' do
        service = create(:service)
        @attr = { :title => 'test' }
        put :update, id: service, :service => @attr
        expect(assigns(:service)).to eq(service)
      end
      it 'returns http redirect' do
        service = create(:service)
        @attr = { :title => 'MyString' }
        put :update, id: service, :service => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_service_path(service))
      end
      it "should update the service" do
        service = create(:service)
        @attr = { 
          :title => 'test',
          :description => 'test' }
        put :update, id: service, :service => @attr
        service.reload
        expect(service.title).to  eq(@attr[:title])
        expect(service.description).to  eq(@attr[:description])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        service = create(:service)
        @attr = { :title => '' }
        put :update, id: service, :service => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change service' do
        service = create(:service)
        @attr = { :title => '' }
        expect do
          put :update, id: service, :service => @attr
        end.not_to change { service.reload.title }
      end
    end
  end

   describe "GET #show" do
    it 'returns http success' do
      service = create(:service)
      get :show, id: service
      expect(response).to have_http_status(:success)
    end
    it 'assigns the service' do
      service = create(:service)
      get :show, id: service
      expect(assigns(:service)).to eq(service)
    end
    it "should render the form elements" do
      service = create(:service)
      get :show, id: service
      expect(page).to have_content(service.title)
      expect(page).to have_content(service.status)
      expect(page).to have_content(service.description)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      service = create(:service)
      expect {
        delete :destroy, id: service
      }.to change(Service, :count).by(-1)
    end

    it "redirects to the field" do
      service = create(:service)
      delete :destroy, id: service
      expect(response).to redirect_to(admin_services_path)
    end
  end

  

end