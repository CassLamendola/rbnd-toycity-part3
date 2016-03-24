class Customer
	attr_reader :name
	attr_accessor :purchases, :returns

	@@customers = []

	def initialize(options = {})
		@name = options[:name]
		add_to_customers
		@purchases = 0
		@returns = 0

	end

	def self.all
		@@customers
	end

	def self.find_by_name(customer_name)
		customer = @@customers.select {|customer| customer.name == customer_name}
		return customer[0]
	end

	def purchase(product)
		Transaction.new(self, product)
	end

	def return_item(product)
		Transaction.new(self, product, item_return: true)
	end

	private

	def add_to_customers
		customer_name = @@customers.select {|customer| customer.name == self.name}
		if customer_name != []
			raise DuplicateCustomerError, "'#{self.name}' already exists."
		else
			@@customers << self
		end
	end
end