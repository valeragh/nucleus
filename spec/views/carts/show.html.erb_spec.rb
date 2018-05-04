require "rails_helper"

RSpec.describe "carts/show" do
  it "displays @cart, @order_items, @order, @categories, @contact the stores" do
    assign(:show, [
      @cart = create(:cart),
      product = create(:product, title: 'Продукт из корзины'),
      @order_items = [create(:order_item, product_id: product.id, cart_id: @cart.id)],
      @categories = [category_one = create(:category, title: 'Первая категория'),
                     category_two = create(:category, title: 'Вторая категория')],
      @contact = create(:contact, phone_one: '12345678', phone_two: '78945612')
    ])
    @order = Order.new
    @q = Product.search(params[:q])
  
    render "layouts/header"
    render

    expect(rendered).to match /Первая категория/
    expect(rendered).to match /Вторая категория/
    expect(rendered).to match /Продукт из корзины/
    expect(rendered).to match /12345678/
    expect(rendered).to match /78945612/
  end
end