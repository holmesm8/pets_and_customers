require 'minitest/autorun'
require 'minitest/pride'
require './lib/day_care'
require './lib/customer'
require './lib/pet'

class DayCareTest < Minitest::Test

  def setup
    @daycare = DayCare.new("Tims Too")
    @joel = Customer.new("Joel", 2)
    @cindy = Customer.new("Cindy", 3)
    @samson = Pet.new({name: "Samson", type: :dog})
    @lucy = Pet.new({name: "Lucy", type: :cat})
    @danny = Pet.new({name: "Danny", type: :dog})
    @xena = Pet.new({name: "Xena", type: :cat})
  end

  def test_it_exists
    assert_instance_of DayCare, @daycare
  end

  def test_it_has_attributes
    assert_equal "Tims Too", @daycare.name
    assert_equal [], @daycare.customers
  end

  def test_it_can_have_multiple_customers_with_multiple_pets
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @cindy.adopt(@danny)
    @cindy.adopt(@xena)
    @daycare.add_customer(@joel)
    @daycare.add_customer(@cindy)
    assert_equal [@joel, @cindy], @daycare.customers
  end

  def test_it_can_find_customer_by_id
    @daycare.add_customer(@joel)
    @daycare.add_customer(@cindy)
    assert_equal @joel, @daycare.find_customer_by_id(2)
    assert_equal @cindy, @daycare.find_customer_by_id(3)
  end

  def test_it_can_find_all_unfed_pets
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @cindy.adopt(@danny)
    @cindy.adopt(@xena)
    @daycare.add_customer(@joel)
    @daycare.add_customer(@cindy)
    assert_equal [@samson, @lucy, @danny, @xena], @daycare.find_unfed_pets
  end

  def test_it_can_charge_customer_for_unfed_pets
    @joel.adopt(@samson)
    @joel.adopt(@lucy)
    @cindy.adopt(@danny)
    @cindy.adopt(@xena)
    @daycare.add_customer(@joel)
    @daycare.add_customer(@cindy)
    assert_equal 25, @daycare.charge_for_unfed_pets
  end
end
