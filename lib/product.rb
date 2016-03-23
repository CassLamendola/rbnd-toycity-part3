class Product
	attr_reader :title
	
	@@products = []

	def initialize(options = {})
		@title = options[:title]
		add_to_products
	end

	def self.all
		@@products
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

	def Product.find_by_title(product_title)
		product = @@products.select {|product| product.title == product_title}
		return product[0]
	end
end