#飲み物の名前、値段、在庫に関するクラス
class Drink
  #新しい飲み物を格納するためのメソッド
  def add_to_drink(drink_name,drink_price,add_stock)
    @drink << {name: "#{name}", price: "#{price}", stock: "#{add_stock}"}
  end
  #問題で設定されている飲み物に関する情報を格納しているメソッド
  def initialize
    @drink = []
    @drink << {name: "cola", price: 120, stock: 5}
    @drink << {name: "water", price: 100, stock: 5}
    @drink << {name: "redbull",price: 200, stock: 5}
  end
end
#自動販売機の内部処理に関するクラス
class VendingMachine
  #変数を初期値を代入
 def initialize
   @slot_money = 0
   @return_money = 0
   @salse_money = 0
   @drink = Drink.new
 end
  #投入できるお金（硬貨紙幣）を設定（freezeメソッドで変更不可に
  MONEY = [10, 50, 100, 500, 1000].freeze

  #投入されたお金が使用可能なお金かどうかを判断するメソッド
 def slot_money(money)
   # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
   # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
   if MONEY.include?(money)
     @slot_money += money
     nil
   else
     money
   end
 end

#投入金額と在庫から現在購入できる飲み物を表示するメソッド
 def can_buy_list
   @can_buy = []
   @drink.map {|drink|
      if drink[:stock].to_i >= 1 && @slot_money >= drink[:price].to_i
        @can_buy << drink[:name]
      else
        nil
      end
    }
    return @can_buy
  end

#購入操作メソッド
def purchase(buy_drink)
  #can_buyのリストの中に入力されたものがあるとき購入処理を行う
  if @can_buy.include?(buy_drink)
    n = 0
    @drink.each do |drink|
      if drink[:name] == buy_drink
        @slot_money -= (drink[:price]).to_i
        @salses_money += (drink[:price]).to_i
        @drink[n][stock] -= 1
      else
        n += 1
      end
    end
  end
end

#売り上げ金額のメソッド
def salses_money
  @salse_money
end

#投入金額返却メソッド
def return_money
  slot_money = @slot_money
  @slot_money = 0
  slot_money
end
end
