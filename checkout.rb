class Checkout
  attr_reader :items, :rules
  attr_accessor :total

  def initialize(rules = nil)
    @rules = rules.to_a
    @items = []
  end

  def scan(item)
    @items << item
    calculate_total!
    apply_promo_rules!
    self
  end

  private

  def calculate_total!
    @total = @items.sum(&:price)
  end

  def apply_promo_rules!
    @rules.sort.each{ |rule| rule.check_applicability_and_apply!(self) }
  end

  def quantity_of_item(item_type)
    items.count{ |item| item.type == item_type }
  end

end