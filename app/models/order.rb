class Order < ApplicationRecord

  def self.evaluate(order_config, current_price)
    if order_config.operation.to_sym == :sell

      variation = (BitcoinStat.last.price - current_price * 1.0)/BitcoinStat.last.price * 100

      if variation >= order_config.alert_variation
        diff = current_price - order_config.price

        gain = (diff/(order_config.price * 1.0))*100

        if gain >= order_config.expected_gain
          Order.create(value: current_price)
        end
      end
    end
  end
end
