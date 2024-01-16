class Invoice < ApplicationRecord

  has_many :cart_items, class_name: 'CartItem', foreign_key: 'invoice_id', dependent: :nullify

  validates :status, presence: true
  validates :status, inclusion: { in: %w(pending completed canceled) }

  after_create :update_cart_items
  after_create :total_price


  enum status: { pending:0, completed: 1, canceled: 2 }

  def total_price
    price = cart_items.sum(&:total_price_product)
    update(total_price: price)
  end

  def update_cart_items
    CartItem.all.where(invoice_id: nil).update_all(invoice_id: self.id)
  end
end
