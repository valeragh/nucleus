require "rails_helper"

RSpec.describe "orders/show" do
  it "displays @cart, @order_items, @order, the orders" do
    assign(:show, [
      @cart = create(:cart),
      product = create(:product, title: 'Продукт из корзины'),
      @order = create(:order),
      @order_items = [create(:order_item, product_id: product.id, cart_id: @cart.id, order_id: @order.id)],
    ])
  
    render

    expect(rendered).to match /Продукт из корзины/
    expect(rendered).to match /Оплатить/
    expect(rendered).to match /Личный кабинет/
  end
end