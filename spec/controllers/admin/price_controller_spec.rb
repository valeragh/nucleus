require 'rails_helper'

RSpec.describe Admin::PricesController, type: :controller do

  render_views
  let(:resource_class) { Price }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the price' do
      price = create(:price)
      get :index
      expect(assigns(:prices)).to include(price)
    end
    it "should render the expected columns" do
      price = create(:price)
      get :index
      expect(page).to have_content(price.price_url)
      expect(page).to have_content(price.status)
    end
  end


  describe "GET edit" do
    it 'returns http success' do
      price = create(:price)
      get :edit, id: price
      expect(response).to have_http_status(:success)
    end
    it 'assigns the price' do
      price = create(:price)
      get :edit, id: price
      expect(assigns(:price)).to eq(price)
    end
    it "should render the form elements" do
      price = create(:price)
      get :edit, id: price
      expect(page).to have_field('Файл Прайса')
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the price' do
        price = create(:price)
        @attr = { status: "Обновлен" }
        put :update, id: price, :price => @attr
        expect(assigns(:price)).to eq(price)
      end
      it 'returns http redirect' do
        price = create(:price)
        @attr = { status: "Обновлен" }
        put :update, id: price, :price => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_prices_path)
      end
      it "should update the price" do
        price = create(:price)
        @attr = { status: "Обновлен" }
        put :update, id: price, :price => @attr
        price.reload
        expect(price.status).to  eq(@attr[:status])
      end
    end
    context 'with invalid params' do
      it 'returns http success' do
        price = create(:price)
        @attr = { :price_url => '' }
        put :update, id: price, :price => @attr
        expect(response).to have_http_status(:success)
      end
      it 'does not change price' do
        price = create(:price)
        @attr = { :price_url => '' }
        expect do
          put :update, id: price, :price => @attr
        end.not_to change { price.reload.price_url.url }
      end
    end
  end

end