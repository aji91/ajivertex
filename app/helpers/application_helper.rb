module ApplicationHelper
	def settings_opend(cname)
		['categories', 'branches', 'departments', 'product_models', 'users', 'clients', 'vendors', 'items'].include?(cname)
	end

	def sales_opend(cname)
		['estimates'].include?(cname)
	end
end
