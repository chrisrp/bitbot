require 'rails_helper'

RSpec.describe BitcoinStat do
  it 'create a stat' do
    FactoryBot.create(:bitcoin_stat)

    expect(BitcoinStat.count).to eq(1)
  end

  describe '#update_highest' do
    context 'when value is lower' do
      it 'do not update' do
        FactoryBot.create(:bitcoin_stat, price: 3000)

        BitcoinStat.update_highest(2995)

        expect(BitcoinStat.last.price).to eq(3000)
      end
    end

    context 'when value is equal' do
      it 'do not update' do
        FactoryBot.create(:bitcoin_stat, price: 3000)

        BitcoinStat.update_highest(3000)

        expect(BitcoinStat.last.price).to eq(3000)
      end
    end

    context 'when value is greater' do
      it 'update' do
        FactoryBot.create(:bitcoin_stat, price: 3000)

        BitcoinStat.update_highest(3001)

        expect(BitcoinStat.last.price).to eq(3001)
      end
    end
  end

  describe '#update_lowest' do
    context 'when value is lower' do
      it 'update' do
        FactoryBot.create(:bitcoin_stat, price: 3000)

        BitcoinStat.update_lowest(2995)

        expect(BitcoinStat.last.price).to eq(2995)
      end
    end

    context 'when value is equal' do
      it 'do not update' do
        FactoryBot.create(:bitcoin_stat, price: 3000)

        BitcoinStat.update_lowest(3000)

        expect(BitcoinStat.last.price).to eq(3000)
      end
    end

    context 'when value is greater' do
      it 'do not update' do
        FactoryBot.create(:bitcoin_stat, price: 3000)

        BitcoinStat.update_lowest(3001)

        expect(BitcoinStat.last.price).to eq(3000)
      end
    end
  end
end
