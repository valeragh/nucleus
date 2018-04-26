require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

  describe 'order_user_confirmation' do
    let(:order) { create(:order, phone: '12345678', delivery: 'Test', email: 'lucas@email.com', description: 'Test') }
    let(:mail) { described_class.order_user_confirmation(order).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq("Спасибо за ваш заказ №#{order.id}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['lucas@email.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['support@nucleus.com.ua'])
    end

  end

end
