
require 'byebug'
require './lib/stock'
require './lib/drink'
require './lib/money'

#自動販売機の内部処理に関するクラス
class VendingMachine
  include Stock
  include Money
  #変数を初期値を代入
 def initialize
   @slot_money = 0
   @return_money = 0
   @salses_money = 0
   @drinks = []
 end


  #投入できるお金（硬貨紙幣）を設定（freezeメソッドで変更不可に
  MONEY = [10, 50, 100, 500, 1000].freeze

  #投入されたお金が使用可能なお金かどうかを判断するメソッド
  #想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
  #が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
  #クラスメソッドとしてcan_buy_listを用いることで、お金を投入した時点で投入金額に応じて
  #購入可能な商品を表示できるようにしている。
 def slot_money(money)
     if MONEY.include?(money)
     @slot_money += money
     self.can_buy_list
   else
     money
   end
 end

 #投入金額と在庫から現在購入できる飲み物を表示するメソッド
 #slot_moneyメソッドにクラスメソッドとして使用
 #クラスメソッドとしてstock_listメソッドを用いることで在庫が一個以上ある
 #飲み物の一覧(ハッシュに名前、価格、在庫を格納)を取得し、それをmapメソッドで
 #投入金額が商品価格以上のとき@can_buy_listに入れ、表示できるようにしている
 def can_buy_list
   @can_buy_list = []
   self.stock_list.map do |drink|
      if @slot_money >= drink[:price]
        @can_buy_list << drink[:name]
     else
       nil
     end
   end
   @can_buy_list
 end

 #購入操作メソッド
 #クラスメソッドとしてcan_buy_listメソッドを用いて、include?メソッドで引数の
 #buy_drinkが@can_buy_listの中に入っているとき、下記の処理を行う
 #stock_listメソッドで定義した@can_buy_drinksをmapメソッドで
 #drink[:name]引数が一致しているなら
 #⒈　投入金額から商品価格を引く
 #⒉ 商品価格を売り上げ金額に加算
 #⒊ クラスメソッドとしてreducd_stockメソッドを用いて、引数の在庫を@drinksから一つ減らす
 #最後に買った商品とお釣りをクラスメソッドのreturn_moneyを用いて表示する。
 #引数のbuy_drinkが@can_buy_listの中に入っていないときは
 #クラスメソッドとしてcan_buy_listメソッドを用いて、再度購入可能な商品を表示。
  def purchase(buy_drink)
    #can_buyのリストの中に入力されたものがあるとき購入処理を行う
    if self.can_buy_list.include?(buy_drink)
      @can_buy_drinks.each do |drink|
        if drink[:name] == buy_drink
          @slot_money -= (drink[:price]).to_i
          @salses_money += (drink[:price]).to_i
          self.reduce_stock(buy_drink)
        end
      end
      p buy_drink
      self.return_money
    else
      self.can_buy_list
    end
  end



  #投入金額返却メソッド
  def return_money
    slot_money = @slot_money
    @slot_money = 0
    slot_money
  end
end
