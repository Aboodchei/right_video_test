module Rules
  class QuantityDiscount < Rule
    PRIORITY = 2
    attr_reader :item_type, :quantity, :discount_amount

    def initialize(item_type:, quantity:, discount_amount:)
      @item_type = item_type
      @quantity = quantity
      @discount_amount = discount_amount
    end

    def applicable?(checkout)
      checkout.quantity_of_item(item_type) >= quantity
    end

    def apply!(checkout)
      # in case there are several bundles
      (checkout.quantity_of_item(item_type) / quantity).times do
        checkout.total -= discount_amount
      end
    end

  end
end