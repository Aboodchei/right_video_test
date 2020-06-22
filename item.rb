class Item
  PRICES = {
    'A' => 30,
    'B' => 20,
    'C' => 50,
    'D' => 15
  }

  attr_reader :price, :type

  def initialize(type)
    @type = type
    @price = PRICES[type]
  end
end