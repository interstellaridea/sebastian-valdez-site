module ApplicationHelper
	def generate_copyright
		SebViewTool::Renderer.copyright 'Sebastian Valdez', 'All rights reserved'
	end
end
