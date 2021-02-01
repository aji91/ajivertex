module ApplicationHelper
	def settings_opend(cname)
		['categories', 'branches', 'departments', 'product_models'].include?(cname)
	end
end
