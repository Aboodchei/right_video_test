module Rules
  class TotalDiscount < Rule
    PRIORITY = 2
    attr_reader :total_condition, :total_amount, :discount_amount

    def initialize(total_amount:, discount_amount:)
      @total_amount = total_amount
      @discount_amount = discount_amount
    end

    def applicable?(checkout)
      checkout.total > total_amount
    end

    def apply!(checkout)
      checkout.total -= discount_amount
    end

  end
end