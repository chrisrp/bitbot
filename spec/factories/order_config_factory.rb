FactoryBot.define do
  factory :order_config do
    operation 'sell'
    price 2000
    alert_variation 2
    expected_gain 3
  end
end
