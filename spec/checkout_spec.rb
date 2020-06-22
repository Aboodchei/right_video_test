RSpec.describe Checkout do
  describe 'Integration Test Scenarios' do
    let(:item_a) { Item.new('A') }
    let(:item_b) { Item.new('B') }
    let(:item_c) { Item.new('C') }
    let(:item_d) { Item.new('D') }
    let(:item_a_rule) { Rules::QuantityDiscount.new(item_type: 'A', quantity: 3, discount_amount: 15)}
    let(:item_b_rule) { Rules::QuantityDiscount.new(item_type: 'B', quantity: 2, discount_amount: 5)}
    let(:total_items_rules) { Rules::TotalDiscount.new(total_amount: 150, discount_amount: 20)}
    let(:checkout) { Checkout.new([item_a_rule, total_items_rules, item_b_rule]) }

    it 'Scenario A' do
      expect(checkout
        .scan(item_a)
        .scan(item_b)
        .scan(item_c).total)
      .to eq(100)
    end

    it 'Scenario B' do
      expect(checkout
        .scan(item_b)
        .scan(item_a)
        .scan(item_b)
        .scan(item_a)
        .scan(item_a).total)
      .to eq(110)
    end

    it 'Scenario C' do
      expect(checkout
        .scan(item_c)
        .scan(item_b)
        .scan(item_a)
        .scan(item_a)
        .scan(item_d)
        .scan(item_a)
        .scan(item_b).total)
      .to eq(155)
    end

    it 'Scenario D' do
      expect(checkout
        .scan(item_c)
        .scan(item_a)
        .scan(item_d)
        .scan(item_a)
        .scan(item_a).total)
      .to eq(140)
    end

  end
end