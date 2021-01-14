require 'pry'

class CashRegister

    attr_reader :total

    def initialize(init_discount = 0.0)
        @total = 0
        @discount = init_discount
        @items = []
    end
    
    def total=(total)
        @total = total
        p "Total: #{@total}"
    end
    
    def discount
        @discount
    end
    
    def add_item(title, price, quantity = 1)
        @prev_trans = {:title => title, :price => price, :quantity => quantity}
        curr_trans = []
        for i in 0...quantity
            @total += price
            curr_trans << title
        end
        @items.push(curr_trans)
    end

    def apply_discount
        if @discount != 0
            @total -= @total * (@discount / 100.0)
            return "After the discount, the total comes to $#{total.floor}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items.flatten
    end

    def void_last_transaction
        @total -= (@prev_trans[:price] * @prev_trans[:quantity])
        @items.pop
    end
end