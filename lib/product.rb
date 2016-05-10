class Product
    attr_accessor :title, :price, :stock

    @@products = []

    def initialize(title, params)
      @title = title
      @price = params[:price]
      @stock = params[:stock]

      if Product.find_by_title(@title)
        raise DuplicateProductError, "#{@title} already exists."
      else
        @@products << self
      end

    end

    def self.all
      @@products
    end

    def self.find_by_title(title)
      @@products.find {|product| title == product.title}
    end

    def in_stock?
      self.stock > 0
    end

    def self.in_stock
      products_with_stock = []
      for product in @@products
        if product.in_stock?
          products_with_stock.push(product)
        end
      end
      products_with_stock
    end
end
