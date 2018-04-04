require "rails_helper"

RSpec.describe "stores/product" do
  it "displays @cart, @categories, @reviews, @product_reviews, @product, @contact the stores" do
    assign(:stores, [
      @cart = create(:cart),
      @order_item = @cart.order_items.new,
      @categories = [category_one = create(:category, title: 'Первая категория'),
                     category_two = create(:category, title: 'Вторая категория')],
      @category = create(:category, title: 'Текущая категория'),
      @pod_category = create(:pod_category, category_id: @category.id, title: 'Текущая подкатегория'),
      @product = create(:product, category_id: @category.id, pod_category_id: @pod_category.id, title: 'Текуший продукт', description: 'Текущее описание'),
      @products = [create(:product, category_id: @category.id, pod_category_id: @pod_category.id, title: 'Первый сопутствующий продукт'),
                   create(:product, category_id: @category.id, pod_category_id: @pod_category.id, title: 'Второй сопутствующий продукт')], 
      @product_reviews = [review_one = create(:review, product_id: @product.id),
                          review_two = create(:review, product_id: @product.id)],
      @reviews = [review_one = create(:review, name: 'Первое имя', description: 'Первый отзыв', product_id: @product.id),
                  review_two = create(:review, name: 'Второе имя', description: 'Второй отзыв', product_id: @product.id)],
      @contact = create(:contact, phone_one: '12345678', phone_two: '78945612')
    ])
  
    render "layouts/header"
    render

    expect(rendered).to match /Первая категория/
    expect(rendered).to match /Вторая категория/
    expect(rendered).to match /Текущая категория/
    expect(rendered).to match /Текущая подкатегория/
    expect(rendered).to match /Текуший продукт/
    expect(rendered).to match /Текущее описание/
    expect(rendered).to match /Первый сопутствующий продукт/
    expect(rendered).to match /Второй сопутствующий продукт/
    expect(rendered).to match /Первое имя/
    expect(rendered).to match /Первый отзыв/
    expect(rendered).to match /Второе имя/
    expect(rendered).to match /Второй отзыв/
    expect(rendered).to match /12345678/
    expect(rendered).to match /78945612/
  end
end