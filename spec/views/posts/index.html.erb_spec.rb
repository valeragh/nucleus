require "rails_helper"

RSpec.describe "posts/index" do
  it "displays @cart, @categories, @reviews, @contact the posts" do
    assign(:posts, [
      @categories = [category_one = create(:category, title: 'Первая категория'),
      category_two = create(:category, title: 'Вторая категория')],
      pod_category = create(:pod_category, category_id: category_one.id, title: 'Первая подкатегория'),
      product = create(:product, category_id: category_one.id, pod_category_id: pod_category.id, title: 'Первый продукт'),
      @reviews = [review_one = create(:review, name: 'Первое имя', product_id: product.id, description: 'Второй отзыв'),
      review_two = create(:review, name: 'Второе имя', product_id: product.id, description: 'Первый отзыв')],
      @contact = create(:contact, phone_one: '12345678', phone_two: '78945612'),
    ])
    assign(:posts, [
      create(:post, title: 'Новость', shot_description: 'Краткое описание'),
      create(:post, title: 'Новость вторая', shot_description: 'Краткое описание вторая')
    ])
    @q = Product.search(params[:q])
    
    render "layouts/header"
    render

    expect(rendered).to match /Первая категория/
    expect(rendered).to match /Вторая категория/
    expect(rendered).to match /Первое имя/
    expect(rendered).to match /Первый отзыв/
    expect(rendered).to match /Первый продукт/
    expect(rendered).to match /Второе имя/
    expect(rendered).to match /Второй отзыв/
    expect(rendered).to match /12345678/
    expect(rendered).to match /78945612/
    expect(rendered).to match /Новость/
    expect(rendered).to match /Новость вторая/
    expect(rendered).to match /Краткое описание/
    expect(rendered).to match /Краткое описание вторая/
  end
end