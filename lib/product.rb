class Product
    attr_accessor :title, :price, :stock
    
    @@products = []
    
    def initialize(params)
        @title = params[:title]
        @price = params[:price]
        @stock = params[:stock]
        
        for product in @@products
            if @title == product.title
                raise DuplicateProductError, "#{@title} already exists."
            else
                @@products << self
            end
        end
        
    end
    
    def self.all
        @@products
    end
end