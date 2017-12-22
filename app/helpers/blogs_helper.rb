module BlogsHelper

	def blog_status_button blog
		# render a group of buttons, set active button from giveing status
		Blog.statuses.keys.map{|state| link_to state, toggle_status_blog_path(blog, state), class: "btn btn-xs #{blog_status?(blog, state)}" }.join.html_safe
	end

	def blog_status? blog, state
		if blog.status == state
			case state
				when 'draft'
					'btn-info'
				when 'pending'
					'btn-warning'
				when 'approved'
					'btn-success'
				when 'published'
					'btn-primary'
				else
					'btn-secondary'
			end
		else
			'btn-secondary'
		end
	end

end
