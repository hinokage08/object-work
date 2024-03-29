# README

## 使い方
1. ファイルをクローンしてきたリポジトリでirbを開き、irb上で

  `$ load './lib/bender.rb'`を入力
1. 自動販売機のインスタンスを作成し、vmという変数に代入

  `$ vm = VendingMachine.new`

1. 作成した自販機に飲み物を格納

  例として

  商品名：コーラ　　　価格：120円　在庫：5個

  商品名：レッドブル　価格：200円　在庫：5個

  商品名：飲料水　　　価格：100円　在庫：5個

  を自動販売機に格納します。

  `$ vm.add_drink("cola",120,5)`

  `$ vm.add_drink("redbull",200,5)`

  `$ vm.add_drink("water",100,5)`

  decide_priceメソッドですでに格納している飲み物の値段を変更することできます。

  例として

  商品名：コーラ　価格：130円に変更　

  `$ vm.decide_price("cola",130)`

  add_stockメソッドですでに格納している飲み物の在庫を変更することができます。

  例として

  商品名：レッドブル　在庫：6個に変更　

  `$ vm.add_stock("redbull",6)`

1. 自動販売機にお金を投入します

  例として

  500円投入します

  `$ vm.slot_money(500)`

  すると、投入金額で購入可能な飲み物が一覧で表示されます。
  このとき、在庫が無い飲み物は商品名の前に「×」が表示されます。

1. 購入可能な飲み物の中から購入したいものを入力することで購入が可能です。

  `$ vm.purchase("cola")`

  購入が完了すると、買った飲み物の商品名とお釣りが出力されます。

  ※購入可能一覧に無いもの、一覧にはあるが商品名の前に×が付いているものを入力すると再度、購入可能な飲み物一覧が表示されます。
