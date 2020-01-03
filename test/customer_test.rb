require 'minitest/autorun'
require 'minitest/pride'
require './lib/customer'
require './lib/pet'

class CustomerTest < Minitest::Test
  def test_it_exists
    joel = Customer.new("Joel", 2)
    assert_instance_of Customer, joel
  end

  def test_it_has_attributes
    joel = Customer.new("Joel", 2)
    assert_equal "Joel", joel.name
    assert_equal 2, joel.id
  end

  def test_it_starts_with_no_pets
    joel = Customer.new("Joel", 2)
    assert_equal [], joel.pets
  end

  def test_it_can_adopt_pets
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    assert_equal [samson, lucy], joel.pets
  end

  def test_its_outstanding_balance_starts_at_zero
    joel = Customer.new("Joel", 2)
    assert_equal 0, joel.outstanding_balance
  end

  def test_it_can_charge_to_increase_outstanding_balance
    joel = Customer.new("Joel", 2)
    joel.charge(15, "haircut")
    joel.charge(7, "washing")
    assert_equal 22, joel.outstanding_balance
  end
end
