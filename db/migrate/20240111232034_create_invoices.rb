class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.integer :status
      t.integer :total_price

      t.timestamps
    end
  end
end
