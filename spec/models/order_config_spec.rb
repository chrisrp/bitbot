require 'rails_helper'

RSpec.describe OrderConfig do
  it 'saves config' do
#    FactoryBot.create(:order_config)
    expect(OrderConfig.count).to eq(1)
  end
end
