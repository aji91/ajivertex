module ApplicationHelper
	def settings_opend(cname)
		['categories', 'branches', 'departments'].include?(cname)
	end
end
