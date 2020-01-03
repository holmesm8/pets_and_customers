class Pet
  attr_reader :name, :type

  def initialize(pet_info)
    @name = pet_info[:name]
    @type = pet_info[:type]
    @fed = false
  end

  def feed
    @fed = true
  end

  def fed?
    @fed
  end
end
