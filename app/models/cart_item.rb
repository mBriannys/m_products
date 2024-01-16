class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :invoice, optional: true

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  scope :by_invoice, -> (invoice_id) { where(invoice_id: invoice_id) }

  def total_price_product
    product.product_price * quantity
  end

  def update_quantity(quantity)
    update(quantity: quantity)
  end

  def self.total_price_cart(args)
    cart_items = args[:cart_items]
    cart_items.sum(&:total_price_product)
  end

end
