class CreateProducts < ActiveRecord::Migration[7.1]
  def up
    create_table :products do |t|
      t.string :product_name
      t.bigint :product_price
      t.string :product_description

      t.timestamps
    end
  end

  def down
    drop_table :products
  end
end
