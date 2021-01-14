require 'pry'

class CashRegister
    attr_reader :total

    def initialize(init_discount = nil)
        @total = 0
        @discount = init_discount
        @items = []
    end
    
    def total=(total)
        @total = total
    end
    
    def discount
        @discount
    end

    def add_item(title, price, quantity = 1)
        @items << {:title => title, :price => price, :quantity => quantity}
        @total += (price * quantity)
    end

    def apply_discount
        if @discount != nil
            @total -= @total * (@discount / 100.0)
            return "After the discount, the total comes to $#{total.floor}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        @items = @items.map{|trans|
            ((trans[:title] + " ") * trans[:quantity]).split(" ")
        }.flatten
    end

    def void_last_transaction
        last_item = @items[@items.length - 1]
        @total -= (last_item[:price] * last_item[:quantity])
        @items.pop
    end
end