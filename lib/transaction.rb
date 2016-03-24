class Transaction
	attr_reader :id, :customer, :product
	
	@@id = 1
	@@transactions = []

	def initialize(customer, product, options = {})
		@customer = customer
		@product = product
		@id = @@id
		@@id += 1
		@@transactions << self
		if options[:item_return]
			increase_stock
			customer.returns += 1
		else
			reduce_stock
			customer.purchases += 1
		end
	end

	def self.all
		@@transactions
	end

	def self.find(id)
		transaction = @@transactions.select {|transaction| transaction.id == id}
		return transaction[0]
	end

	private
	
	def reduce_stock
		if @product.stock > 0
			@product.stock -= 1
		else
			raise OutOfStockError, "#{@product.title} is out of stock."
		end
	end

	def increase_stock
		@product.stock += 1
	end
end