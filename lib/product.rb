class Product
    attr_accessor :title, :price, :stock
    
    @@products = []
    
    def initialize(params)
        @title = params[:title]
        @price = params[:price]
        @stock = params[:stock]
        
        # @@products.each_with_index do |product, index|
        #     if @title == product.title && product.title != nil
        #         raise DuplicateProductError, "#{@title} already exists."
        #     else
        #         @@products << self
        #     end
        # end
        
        if @@products.map { |product| product.title}.include? @title
            raise DuplicateProductError, "#{@title} already exists."
        else
            @@products << self
        end
        
    end
    
    def self.all
        @@products
    end
    
    def find_by_title(title)
        product = self
        for prod in @@products
            if title == prod.title
                product = prod
            end
        end
        product
    end
end