module ApplicationHelper
	def settings_opend(cname)
		['categories', 'branches', 'departments', 'product_models', 'users', 'clients', 'vendors', 'items'].include?(cname)
	end
end
