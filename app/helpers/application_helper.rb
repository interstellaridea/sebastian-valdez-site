module ApplicationHelper
	def generate_copyright
		SebViewTool::Renderer.copyright 'Sebastian Valdez', 'All rights reserved'
	end

	def flash_class(level)
		case level
			when 'notice' then "alert alert-info"
			when 'success' then "alert alert-succesles"
			when 'error' then "alert alert-danger"
			when 'alert' then "alert alert-danger"
		end
	end
end
