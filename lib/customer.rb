class Customer
	attr_reader :name

	@@customers = []

	def initialize(options = {})
		@name = options[:name]
		add_to_customers
	end

	def self.all
		@@customers
	end

	def Customer.find_by_name(customer_name)
		customer = @@customers.select {|customer| customer.name == customer_name}
		return customer[0]
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