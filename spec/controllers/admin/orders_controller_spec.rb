require 'rails_helper'

RSpec.describe Admin::OrdersController, type: :controller do

  render_views
  let(:resource_class) { Order }
  let(:all_resources)  { ActiveAdmin.application.namespaces[:admin].resources }
  let(:resource)       { all_resources[resource_class] }
  let(:page) { Capybara::Node::Simple.new(response.body) } 
  login_admin

  describe "GET index" do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
    it 'assigns the order' do
      order = create(:order)
      get :index
      expect(assigns(:orders)).to include(order)
    end
    it "should render the expected columns" do
      order = create(:order)
      get :index
      expect(page).to have_content(order.id)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.total)
    end
  end

  describe "GET edit" do
    it 'returns http success' do
      order = create(:order)
      get :edit, id: order
      expect(response).to have_http_status(:success)
    end
    it 'assigns the order' do
      order = create(:order)
      get :edit, id: order
      expect(assigns(:order)).to eq(order)
    end
    it "should render the form elements" do
      order = create(:order)
      get :edit, id: order
      expect(page).to have_field('Статус')
    end
  end

  describe "PUT update" do
    context 'with valid params' do
      it 'assigns the order' do
        order = create(:order)
        @attr = { :status => 'test' }
        put :update, id: order, :order => @attr
        expect(assigns(:order)).to eq(order)
      end
      it 'returns http redirect' do
        order = create(:order)
        @attr = { :status => 'test' }
        put :update, id: order, :order => @attr
        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to(admin_order_path(order))
      end
      it "should update the order" do
        order = create(:order)
        @attr = { :status => 'test' }
        put :update, id: order, :order => @attr
        order.reload
        expect(order.status).to  eq(@attr[:status])
      end
    end
  end

   describe "GET show" do
    it 'returns http success' do
      cart = create(:cart)
      order = create(:order)
      product = create(:product, title: 'Текущий продукт', price: '9')
      order_item = create(:order_item, cart_id: cart.id, product_id: product.id, quantity: '1', unit_price: product.price, order_id: order.id)
      get :show, id: order
      expect(response).to have_http_status(:success)
    end
    it 'assigns the order' do
      cart = create(:cart)
      order = create(:order)
      product = create(:product, title: 'Текущий продукт', price: '9')
      order_item = create(:order_item, cart_id: cart.id, product_id: product.id, quantity: '1', unit_price: product.price, order_id: order.id)
      get :show, id: order
      expect(assigns(:order)).to eq(order)
    end
    it "should render the form elements" do
      cart = create(:cart)
      order = create(:order)
      product = create(:product, title: 'Текущий продукт', price: '9')
      order_item = create(:order_item, cart_id: cart.id, product_id: product.id, quantity: '1', unit_price: product.price, order_id: order.id)
      get :show, id: order
      expect(page).to have_content(order.id)
      expect(page).to have_content(order.status)
      expect(page).to have_content(order.total)
      expect(page).to have_content(order_item.product.title)
      expect(page).to have_content(order_item.quantity)
      expect(page).to have_content(order_item.unit_price)
      expect(page).to have_content(order_item.total_price)
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested select_option" do
      order = create(:order)
      expect {
        delete :destroy, id: order
      }.to change(Order, :count).by(-1)
    end

    it "redirects to the field" do
      order = create(:order)
      delete :destroy, id: order
      expect(response).to redirect_to(admin_orders_path)
    end
  end

  

end