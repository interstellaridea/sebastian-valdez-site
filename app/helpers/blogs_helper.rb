module BlogsHelper
	def active_blog? option, blog
		if blog.status == option
			"btn-success"
		else
			"btn-secondary"
		end
	end
end
