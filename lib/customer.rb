class Customer
  attr_accessor :name
  @@customers = []

  def initialize(params)
    @name = params[:name]

    if @@customers.find {|customer| @name == customer.name}
      raise DuplicateCustomerError, "#{@name} already exists."
    else
      @@customers << self
    end
  end

  def self.find_by_name(name)
    @@customers.find {|customer| name == customer.name}
  end

  def self.all
    @@customers
  end
end
