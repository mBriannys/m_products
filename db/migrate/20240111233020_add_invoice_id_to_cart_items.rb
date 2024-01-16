class AddInvoiceIdToCartItems < ActiveRecord::Migration[7.1]
  def up
    add_reference :cart_items, :invoice, foreign_key: true
  end

  def down
    remove_reference :cart_items, :invoice, foreign_key: true
  end
end
