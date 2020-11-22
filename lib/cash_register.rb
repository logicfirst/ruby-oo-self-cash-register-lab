class CashRegister

  attr_accessor :total, :discount, :title, :items, :transactions

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end

  def add_item(title, price, quantity = 1)
    @items << (title * quantity)
    @total = @total + (price * quantity)
    @transactions << (price * quantity)
  end

  def apply_discount
    if @discount == 0
      "There is no discount to apply."
    else @total = @total - @total * @discount/100
    "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @transactions[-1] 
  end

end
