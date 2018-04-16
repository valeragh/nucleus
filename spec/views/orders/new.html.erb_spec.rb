require "rails_helper"

RSpec.describe "orders/new" do
  it "displays new @cart, @categories, @reviews, @contact the orders" do
    @order = Order.new
    assign(:orders, [
      @categories = [category_one = create(:category, title: 'Первая категория'),
                     category_two = create(:category, title: 'Вторая категория')],
      pod_category = create(:pod_category, category_id: category_one.id, title: 'Первая подкатегория'),
      @contact = create(:contact, phone_one: '12345678', phone_two: '78945612')
    ])
    
    render "layouts/header"
    render

    expect(rendered).to match /Первая категория/
    expect(rendered).to match /Вторая категория/
    expect(rendered).to match /12345678/
    expect(rendered).to match /78945612/
  end

end