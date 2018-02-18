Given("that I want to {string}") do |value|
  @what_i_want = value.to_sym
end

Given("the current price is {float}$") do |value|
  BitcoinStat.new(price: value * 100).save
end

When("an price check of {float}$") do |current_value|
  if @what_i_want == :sell
    BitcoinStat.update_highest(current_value * 100)
  elsif @what_i_want == :buy
    BitcoinStat.update_lowest(current_value * 100)
  end
end

Then("the current price becomes {float}$") do |value|
  expect(BitcoinStat.last.price).to eq(value*100)
end
