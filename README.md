# right.video coding test

This is the coding test for the right.video upwork job post.

This challenge took me around an hour and 30 minutes.

You can run the tests via `bundle exec rspec`

In order to try out the code, you can also run `irb` and try it out.

Interface:

```ruby
Item.new('A')
Rules::QuantityDiscount.new(item_type: 'A', quantity: 3, discount_amount: 15)
Rules::TotalDiscount.new(total_amount: 150, discount_amount: 20)
Checkout.new([rule])
checkout.scan(item).scan(item) # scans are chainable for ease

checkout.total # totals are updated automatically after every scan
```

## Extra notes:
- Added a priority flag for every rule in order to be able to get the same result regardless of the order the rules are inputted into a checkout
- The bundle discount is applied multiple times (eg. quantity is 4, rule is 2, and discount is 10, 20 will be discounted)
