class Drink
  attr_accessor :price
  attr_accessor :stock
  def initialize(name,price,stock)
    @name = name
    @price = price
    @stock = stock
  end

  def to_hash
    {name: @name, price: @price, stock: @stock}
  end
end
