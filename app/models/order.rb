# == Schema Information
#
# Table name: orders
#
#  id              :integer          not null, primary key
#  order_status_id :integer
#  user_id         :integer
#  total           :decimal(12, 3)
#  delivery        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  phone           :string
#  description     :text
#  email           :string
#  status          :string
#

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :order_items, :dependent => :destroy
  before_create :set_order_status
  before_save :update_subtotal
  before_save :set_user

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

	private
	  def set_order_status
	    self.status = "Новый"
	  end

	  def update_subtotal
	    self[:total] = subtotal
	  end

    def set_user
      user = User.where(email: self[:email]).first_or_create do |user|
        user.email = self[:email]
        user.password = Devise.friendly_token[0,20]
      end
      self[:user_id] = user.id
    end
end
