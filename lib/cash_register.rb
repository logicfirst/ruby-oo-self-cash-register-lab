require 'pry'

class CashRegister

  def initialize(emp_discount = nil)
    @total = 0
    @emp_discount = emp_discount
    @item_list = []
    @transaction_costs = []
  end

  def discount
    @emp_discount
  end

  def total=(total)
    @total = total
  end

  def total
    @total
  end

  def add_item(title, price, quantity = 1)
    transaction_price = price * quantity
    @transaction_costs.push(transaction_price)
    quantity.times do
      @item_list.push(title)
    end

    self.total += price * quantity
  end

  def apply_discount
    if @emp_discount == nil
      return "There is no discount to apply."
    else
      self.total = self.total - (self.total * (@emp_discount / 100.to_f))
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
  end

  def items
    return @item_list
  end

  def void_last_transaction
    self.total = self.total - @transaction_costs[-1]
    @transaction_costs.pop()
    return self.total
  end

end

