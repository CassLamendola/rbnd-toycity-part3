class Product
	attr_reader :title, :price, :brand
	attr_accessor :stock
	
	@@products = []

	def initialize(options = {})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		@brand = options[:brand]
		add_to_products
	end

	def self.all
		@@products
	end

	def in_stock?
		@stock > 0
	end

	def Product.find_by_title(product_title)
		product = @@products.select {|product| product.title == product_title}
		return product[0]
	end

	def Product.in_stock
		@@products.select {|product| product.stock > 0}
	end

	private

	def add_to_products
		product_title = @@products.select {|product| product.title == self.title}
		if product_title != []
			raise DuplicateProductError, "#{self.title} already exists."
		else
			@@products << self
		end
		
	end

end