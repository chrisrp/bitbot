class BitcoinStat < ApplicationRecord
  def self.update_highest(value)
    current = last

     if current.price < value
       current.price = value
       current.save!
     end
  end

  def self.update_lowest(value)
    current = last

     if current.price > value
       current.price = value
       current.save!
     end
  end
end
