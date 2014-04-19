module ApplicationHelper

	def  flash_class(type)
		case type
		when "alert"
			"bg-warning"
		when "notice"
			"bg-success"
		else
			""
		end
	end
end
