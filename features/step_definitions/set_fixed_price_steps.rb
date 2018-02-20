Given("that I want to {string}") do |value|
  @order_config = FactoryBot.create(:order_config, operation: value)
end

Given("the current price is {float}$") do |value|
  BitcoinStat.new(price: value * 100).save
end

When("an price check of {float}$") do |current_value|
  if @order_config.operation.to_sym == :sell
    BitcoinStat.update_highest(current_value * 100)
  elsif @order_config.operation.to_sym == :buy
    BitcoinStat.update_lowest(current_value * 100)
  end
end

Then("the current price becomes {float}$") do |value|
  expect(BitcoinStat.last.price).to eq(value*100)
end
