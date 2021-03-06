require "rails_helper"

RSpec.describe "stores/category" do
  it "displays @cart, @categories, @category, @reviews, @contact the stores" do
    assign(:stores, [
      @categories = [category_one = create(:category, title: 'Первая категория'),
      category_two = create(:category, title: 'Вторая категория')],
      @category = create(:category, title: 'Текущая категория'),
      @pod_categories = [create(:pod_category, category_id: @category.id, title: "Первая текущая подкатегория")],
      pod_category = create(:pod_category, category_id: @category.id, title: 'Первая подкатегория'),
      product = create(:product, category_id: category_one.id, pod_category_id: pod_category.id, title: 'Первый продукт'),
      @reviews = [review_one = create(:review, name: 'Первое имя', product_id: product.id, description: 'Второй отзыв'),
      review_two = create(:review, name: 'Второе имя', product_id: product.id, description: 'Первый отзыв')],
      @contact = create(:contact, phone_one: '12345678', phone_two: '78945612')
    ])
    @q = Product.search(params[:q])

    render "layouts/header"
    render

    expect(rendered).to match /Первая категория/
    expect(rendered).to match /Вторая категория/
    expect(rendered).to match /Текущая категория/
    expect(rendered).to match /Первая текущая подкатегория/
    expect(rendered).to match /Первое имя/
    expect(rendered).to match /Первый отзыв/
    expect(rendered).to match /Первый продукт/
    expect(rendered).to match /Второе имя/
    expect(rendered).to match /Второй отзыв/
    expect(rendered).to match /12345678/
    expect(rendered).to match /78945612/
  end
end