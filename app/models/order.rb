# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  data            :text
#  delivery        :string
#  description     :text
#  email           :string
#  payment_status  :string           default("Неоплаченный")
#  phone           :string
#  status          :string
#  total           :decimal(12, 3)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  order_status_id :integer
#  user_id         :integer
#
# Indexes
#
#  index_orders_on_order_status_id  (order_status_id)
#

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, :dependent => :destroy
  before_create :set_order_status
  before_save :update_subtotal, if: :new_record?
  before_save :set_user, if: :new_record?

  validates :phone, :email, :delivery, presence: true
  validates_format_of :email, :with => /@/

  DELIVERY_TYPES = ["Новая почта", "Деливери", "Интайм"]
  STATUS_TYPES = ["Новый", "Обработанный"]

  def add_order_items_from_cart(cart)
    cart.order_items.each do |item|
      item.cart_id = nil
      order_items << item
    end
  end

  def subtotal
    order_items.to_a.sum { |item| item.total_price}
  end

  def status_class
    if status == 'Новый'
      "warning"
    elsif status == 'Обработанный'
      "success"
    end
  end

  def payment_status_class
    if payment_status == 'Неоплаченный'
      "warning"
    elsif payment_status == 'Оплаченный'
      "success"
    elsif payment_status == 'Ошибка'
      "danger"
    end
  end

	private
	  def set_order_status
	    self.status = "Новый"
	  end

	  def update_subtotal
	    self[:total] = subtotal
	  end

    def set_user
      generated_password = Devise.friendly_token[0,8]
      user = User.where(email: self[:email]).first_or_create do |user|
        user.email = self[:email]
        user.password = generated_password
        user.send_password = false
        user.name = self[:name]
        user.phone = self[:phone]
      end
      self[:user_id] = user.id
      unless user.send_password?
        DelayJob.perform_in(5, user, generated_password)
      end
      user.send_password = true
      user.save
    end
end
