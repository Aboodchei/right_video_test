require './checkout.rb'
require './item.rb'
require './rule.rb'
Dir['./rules/*.rb'].each { |f| require_relative(f) }