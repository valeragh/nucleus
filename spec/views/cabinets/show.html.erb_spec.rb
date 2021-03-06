require "rails_helper"

RSpec.describe "cabinets/show" do
  it "displays @order_items, @order, @categories, @contact the stores" do
    assign(:show, [
      @cart = create(:cart),
      @user = create(:user, name: 'Имя', phone: '(050)555-55-55'),
      @categories = [category_one = create(:category, title: 'Первая категория'),
                     category_two = create(:category, title: 'Вторая категория')],
      pod_category = create(:pod_category, category_id: category_one.id, title: 'Первая подкатегория'),
      @contact = create(:contact, phone_one: '12345678', phone_two: '78945612'),
      product = create(:product, category_id: category_one.id, title: 'Продукт из корзины', pod_category_id: pod_category.id),
      @reviews = [review_one = create(:review, name: 'Первое имя', product_id: product.id, description: 'Второй отзыв'),
                  review_two = create(:review, name: 'Второе имя', product_id: product.id, description: 'Первый отзыв')],
      order_items = [create(:order_item, product_id: product.id, cart_id: @cart.id)],
      @order = create(:order, user_id: @user.id),
      @q = Product.search(params[:q]),
    ])
    @back_phone = BackPhone.new

    render "layouts/header"
    render
    render "layouts/footer"

    expect(rendered).to match /12345678/
    expect(rendered).to match /78945612/
  end
end