require 'minitest/autorun'
require 'minitest/pride'
require './lib/groomer'
require './lib/customer'
require './lib/pet'

class GroomerTest < Minitest::Test
  def test_it_exists
    groomer = Groomer.new("The Hair Ball")
    assert_instance_of Groomer, groomer
  end

  def test_it_has_a_name
    groomer = Groomer.new("The Hair Ball")
    assert_equal "The Hair Ball", groomer.name
  end

  def test_it_starts_with_no_customers
    groomer = Groomer.new("The Hair Ball")
    assert_equal [], groomer.customers
  end

  def test_it_can_add_customers
    groomer = Groomer.new("The Hair Ball")
    joel = Customer.new("Joel", 2)
    billy = Customer.new("Billy", 3)
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    assert_equal [joel, billy], groomer.customers
  end

  def test_it_can_count_the_number_of_pets_of_a_certain_type
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog})
    lucy = Pet.new({name: "Lucy", type: :cat})
    joel.adopt(samson)
    joel.adopt(lucy)
    billy = Customer.new("Billy", 3)
    molly = Pet.new({name: "Molly", type: :cat})
    billy.adopt(molly)
    groomer = Groomer.new("The Hair Ball")
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    assert_equal 2, groomer.number_of_pets(:cat)
  end

  def test_it_can_list_customers_with_outstanding_balances
    joel = Customer.new("Joel", 2)
    joel.charge(10)
    billy = Customer.new("Billy", 3)
    groomer = Groomer.new("The Hair Ball")
    groomer.add_customer(joel)
    groomer.add_customer(billy)
    assert_equal [joel], groomer.customers_with_oustanding_balances
  end

  def test_it_can_charge_customers
    groomer = Groomer.new("The Hair Ball")
    joel = Customer.new("Joel", 2)
    samson = Pet.new({name: "Samson", type: :dog})
    sam = Customer.new("Sam", 3)
    duece = Pet.new({name: "Duece", type: :dog})
    ozzie = Pet.new({name: "Ozzie", type: :cat})
    harley = Pet.new({name: "Harley", type: :cat})
    joel.adopt(samson)
    joel.adopt(harley)
    sam.adopt(duece)
    sam.adopt(ozzie)
    groomer.add_customer(joel)
    groomer.add_customer(sam)
    groomer.charge(joel, samson, "hair cut")
    groomer.charge(sam, ozzie, "bath")

    assert_equal 40, joel.outstanding_balance
    assert_equal 60, sam.outstanding_balance
  end
end
