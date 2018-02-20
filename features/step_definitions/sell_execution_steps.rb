Given("the buy price was {float}$") do |buy_price|
  @order_config.price = buy_price
  @order_config.save
end

Given("the alert variation is {string}") do |value|
  @order_config.alert_variation = value.to_f
  @order_config.save
end

Given("the gain is greater than {string}") do |value|
  @order_config.expected_gain = value.to_f
  @order_config.save
end

Then("an order is placed at {float}$") do |value|
  Order.evaluate(@order_config, BitcoinStat.last)
  expect(Order.last.value).to eq((value*100).to_i)
end

