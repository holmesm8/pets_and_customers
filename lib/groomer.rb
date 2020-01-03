class Groomer
  attr_reader :name, :customers

  def initialize(name)
    @name = name
    @customers = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def number_of_pets(type)
    pets = @customers.map {|cust| cust.pets}.flatten
    pets.count {|pet| pet if pet.type == type}
  end

  def customers_with_oustanding_balances
    @customers.find_all {|cust| cust if cust.outstanding_balance > 0}
  end

  def charge(customer, pet, service)
    customer.charge(pet, service)
  end
end
