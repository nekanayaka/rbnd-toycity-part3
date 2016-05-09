class Transaction
  attr_accessor :customer, :product
  attr_reader :id

  @@id = 1
  @@transactions = []

  def initialize(customer, product)
    @id = @@id
    @@id += 1
    @customer = customer
    @product = product
    @@transactions << self
  end

  def self.all
    @@transactions
  end
end
