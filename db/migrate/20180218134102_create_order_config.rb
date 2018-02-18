class CreateOrderConfig < ActiveRecord::Migration[5.1]
  def up
    create_table :order_configs do |t|
      t.string :operation, null: false
      t.decimal :alert_variation, null: false
      t.decimal :expected_gain, null: false
      t.integer :price, null: false

      t.timestamps
    end
  end

  def down
    drop_table :order_configs
  end
end
