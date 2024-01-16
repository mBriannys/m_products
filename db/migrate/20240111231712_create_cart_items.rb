class CreateCartItems < ActiveRecord::Migration[7.1]
  def up
    create_table :cart_items do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end

  def down
    drop_table :cart_items
  end
end
