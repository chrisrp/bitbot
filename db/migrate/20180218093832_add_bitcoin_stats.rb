class AddBitcoinStats < ActiveRecord::Migration[5.1]
  def up
    create_table :bitcoin_stats do |t|
      t.integer :price, null: false

      t.timestamps
    end
  end

  def down
    drop_table :bitcoin_stats
  end
end
