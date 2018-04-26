require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  describe 'letter_admin_confirmation' do
    let(:letter) { create(:letter, name: 'Lucas', email: 'lucas@email.com', description: 'Test') }
    let(:mail) { described_class.letter_admin_confirmation(letter).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq('Новый вопрос от Lucas')
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['alinamagazin56@gmail.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['support@nucleus.com.ua'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(letter.name)
    end

    it 'assigns letter @email' do
      expect(mail.body.encoded)
        .to match(letter.email)
    end

    it 'assigns letter @description' do
      expect(mail.body.encoded)
        .to match(letter.description)
    end

  end

  describe 'back_phone_admin_confirmation' do
    let(:back_phone) { create(:back_phone, name: 'Lucas', phone: '12345678') }
    let(:mail) { described_class.back_phone_admin_confirmation(back_phone).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq("Новый запрос на обратный звонок от #{back_phone.name}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['alinamagazin56@gmail.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['support@nucleus.com.ua'])
    end

    it 'assigns back_phone @name' do
      expect(mail.body.encoded).to match(back_phone.name)
    end

    it 'assigns back_phone @phone' do
      expect(mail.body.encoded)
        .to match(back_phone.phone)
    end

  end

  describe 'order_admin_confirmation' do
    let(:order) { create(:order, phone: '12345678', delivery: 'Test', email: 'lucas@email.com', description: 'Test') }
    let(:mail) { described_class.order_admin_confirmation(order).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq("Новый заказ №#{order.id}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['alinamagazin56@gmail.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['support@nucleus.com.ua'])
    end

    it 'assigns order @phone' do
      expect(mail.body.encoded)
        .to match(order.phone)
    end

    it 'assigns order @delivery' do
      expect(mail.body.encoded)
        .to match(order.delivery)
    end

    it 'assigns order @email' do
      expect(mail.body.encoded)
        .to match(order.email)
    end

    it 'assigns order @description' do
      expect(mail.body.encoded)
        .to match(order.description)
    end

  end

  describe 'review_admin_confirmation' do
  	let(:product) { create(:product, title: "Test Product") }
    let(:review) { create(:review, name: 'Lucas', description: 'Test', product_id: product.id) }
    let(:mail) { described_class.review_admin_confirmation(review).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq("Новый отзыв от #{review.name}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['alinamagazin56@gmail.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['support@nucleus.com.ua'])
    end

    it 'assigns review @name' do
      expect(mail.body.encoded).to match(review.name)
    end

    it 'assigns review @product' do
      expect(mail.body.encoded)
        .to match(review.product.title)
    end

    it 'assigns review @description' do
      expect(mail.body.encoded)
        .to match(review.description)
    end

  end
end
