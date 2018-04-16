require "rails_helper"

RSpec.describe "reviews/show" do
  it "displays index @cart, @categories, @review, @contact the reviews" do
    assign(:reviews, [
      @categories = [category_one = create(:category, title: 'Первая категория'),
                     category_two = create(:category, title: 'Вторая категория')],
      @category = create(:category, title: 'Текущая категория'),
      @pod_category = create(:pod_category, category_id: @category.id, title: 'Текущая подкатегория'),
      @product = create(:product, category_id: @category.id, pod_category_id: @pod_category.id, title: 'Текуший продукт', description: 'Текущее описание'),
      @review = create(:review, name: 'Первое имя', description: 'Первый отзыв', product_id: @product.id, status: 'Показать'),
      @contact = create(:contact, phone_one: '12345678', phone_two: '78945612')
    ])
    
    render "layouts/header"
    render

    expect(rendered).to match /Первая категория/
    expect(rendered).to match /Вторая категория/
    expect(rendered).to match /Первое имя/
    expect(rendered).to match /Первый отзыв/
    expect(rendered).to match /Текуший продукт/
    expect(rendered).to match /12345678/
    expect(rendered).to match /78945612/
  end

end