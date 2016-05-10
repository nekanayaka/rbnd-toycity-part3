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
    @product.stock -= 1
  end

  def self.all
    @@transactions
  end

  def self.find(transaction_index)
    @@transactions[transaction_index - 1]
  end
end
