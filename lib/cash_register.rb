class CashRegister

    attr_accessor :total
    
    def initialize(employee_discount = 0)
        @total = 0
        @employee_discount = employee_discount
        @all_items = []
    end

    def discount
        @employee_discount
    end

    def add_item(title, price, quantity = 1)
        @total += (price * quantity)
        @all_items << {:title => title, :price => price, :quantity => quantity}
        # count = 0
            # while count < quantity
            #     @all_items << title
            #         count += 1
            # end
    end
    
    def apply_discount
        @total = @total - (@total * (@employee_discount / 100.0))
        if @employee_discount != 0
            "After the discount, the total comes to $#{@total.floor}."
        else
            "There is no discount to apply."
        end
        # binding.pry
    end

    def items
    @all_items = @all_items.map do |items|
            ((items[:title] + " ") * items[:quantity]).split()
    end.flatten
    end

    def void_last_transaction
        voided_item = @all_items.pop
        @total -= (voided_item[:price] * voided_item[:quantity])
    end
end