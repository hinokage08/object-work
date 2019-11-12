module Stock
  #飲み物の種類を増やしたい時のメソッド
  def add_drink(name,price,stock)
    @drinks <<  Drink.new(name,price,stock)
  end

  #飲み物の在庫を増やしたい時のメソッド
  def add_stock(name,stock)
    @drinks.each do |drink|
      if drink.to_hash[:name] == name
        drink.stock = stock
      end
    end
  end

  def stock_list
    @can_buy_drinks = []
    @drinks.each do |drink|
      if drink.to_hash[:stock] >=1
        @can_buy_drinks << drink.to_hash
      else
        drink = drink.to_hash
        drink.to_hash[:name] = "× #{drink.to_hash[:name]}"
        @can_buy_drinks << drink.to_hash
      end
      @can_buy_drinks
    end
  end

  #飲み物の購入ができた時、在庫を１個減らす
  def reduce_stock(buy_drink)
    @drinks.each do |drink|
      if drink.to_hash[:name] == buy_drink
        drink.stock -= 1
      end
    end
  end
end
