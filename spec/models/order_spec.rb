require 'rails_helper'

RSpec.describe Order do
  it 'creates an order' do
    FactoryBot.create(:order)
    expect(Order.count).to eq(1)
  end

  describe '.evaluate' do
    let(:order_config) { FactoryBot.build(:order_config, price: 5000, operation: :sell, alert_variation: 1.5, expected_gain: 2) }
    let(:bitcoin_stat) { FactoryBot.create(:bitcoin_stat, price: 5200) }

    it 'creates an order' do
      bitcoin_stat
      described_class.evaluate(order_config, 5100)

      expect(Order.count).to eq(1)
      expect(Order.last.value).to eq(5100)
    end
  end
end
