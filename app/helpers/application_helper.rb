module ApplicationHelper
	def settings_opend(cname)
		['categories', 'branches', 'departments', 'product_models', 'users', 'clients', 'vendors', 'items'].include?(cname)
	end

	def sales_opend(cname)
		['estimates', 'proformas', 'sale_orders'].include?(cname)
	end

	def number_to_indian_rupee(rupees)
		number_to_indian_currency(rupees)
	end
end
