require 'rails_helper'

RSpec.describe Admin::DataProductsController, type: :controller do

  render_views
  let(:resource_class) { DataProduct }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the data_product' do
      data_product = create(:data_product)
      get :index
      expect(assigns(:data_products)).to include(data_product)
    end
    it "should render the expected columns" do
      data_product = create(:data_product)
      get :index
      expect(page).to have_content(data_product.file_url)
    end
  end


  describe "GET edit" do
    it 'returns http success' do
      data_product = create(:data_product)
      get :edit, id: data_product
      expect(response).to have_http_status(:success)
    end
    it 'assigns the data_product' do
      data_product = create(:data_product)
      get :edit, id: data_product
      expect(assigns(:data_product)).to eq(data_product)
    end
    it "should render the form elements" do
      data_product = create(:data_product)
      get :edit, id: data_product
      expect(page).to have_field('Файл Базы')
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the data_product' do
        data_product = create(:data_product)
        @attr = { file_url: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test_data.xlsx'))) }
        put :update, id: data_product, :data_product => @attr
        expect(assigns(:data_product)).to eq(data_product)
      end
      it 'returns http redirect' do
        data_product = create(:data_product)
        @attr = { file_url: Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/fixtures/myfiles/test_data.xlsx'))) }
        put :update, id: data_product, :data_product => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_data_products_path)
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        data_product = create(:data_product)
        @attr = { :file_url => '' }
        put :update, id: data_product, :data_product => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change data_product' do
        data_product = create(:data_product)
        @attr = { :file_url => '' }
        expect do
          put :update, id: data_product, :data_product => @attr
        end.not_to change { data_product.reload.file_url.url }
      end
    end
  end

end