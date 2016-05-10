require_relative "transaction"
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

  def purchase(product)
    if product.stock > 0
      self_transaction = Transaction.new(self, product)
      puts "#{product.title} Purchased by #{self.name}"
    else
      raise OutOfStockError, "#{product.title} is out of stock."
    end
  end
end
