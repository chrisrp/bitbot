require 'rails_helper'

RSpec.describe BitcoinStat do
  it 'create a stat' do
    FactoryBot.create(:bitcoin_stat)

    expect(BitcoinStat.count).to eq(1)
  end

end
