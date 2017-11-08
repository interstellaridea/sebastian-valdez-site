module BlogsHelper

	def blog_link_generator blog
		states = Blog.statuses.keys
		states.map{|s| link_to "#{s}", '#', class: "#{active_blog? s, blog} btn btn-sm" }.join.html_safe
	end

	def active_blog? state, blog
		if blog.status == state
			"btn-success"
		else
			"btn-secondary"
		end
	end

end