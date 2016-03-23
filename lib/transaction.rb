class Transaction
	attr_reader :id, :customer, :product
	
	@@id = 1
	@@transactions = []

	def initialize(customer, product)
		@customer = customer
		@product = product
		@id = @@id
		@@id += 1
		@@transactions << self
		reduce_stock
	end

	def self.all
		@@transactions
	end

	private
	
	def reduce_stock
		if @product.stock > 0
			@product.stock -= 1
		else
			raise OutOfStockError, "#{@product.title} is out of stock."
		end
	end
end