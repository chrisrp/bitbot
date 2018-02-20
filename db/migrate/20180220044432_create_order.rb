class CreateOrder < ActiveRecord::Migration[5.1]
  def up
    create_table :orders do |t|
      t.integer :value, null: false

      t.timestamps
    end
  end

  def down
    drop_table :orders
  end
end
