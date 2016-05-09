class Transaction
  attr_accessor :customer, :product
  attr_reader :id

  @@id = 1
  @@transactions = []

  def initialize(params)
    @id = @@id
    @@id++
    @customer = params[:customer]
    @product = params[:product]
  end
end
