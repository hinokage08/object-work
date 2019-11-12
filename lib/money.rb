module Money
  #飲み物の値段を変える時のメソッド
  def decide_price(name,price)
    @drinks.each{|drink|
      if drink.to_hash[:name] == name
        drink.price = price
      end
    }
  end

  #飲み物の値段を返す時のメソッド
  def drink_price(name)
    @drinks.map{|drink|
      if drink[:name] == name
        if drink[:stock] >= 1
          drink[:name]
        else
          "在庫切れ"
        end
      end
    }
  end

  #飲み物を購入可能かどうか判断し
  #購入可能の場合,売り上げ、釣り銭を表示
  #購入不可の場合,再度購入可能リストを表示させるメソッド

  #売り上げ金額のメソッド
  def salses_money
    @salse_money
  end
end
